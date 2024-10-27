const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const Mux = require("@mux/mux-node");

const kTokenId = "85e7cde7-008d-40af-9bdb-1c4ca860fda2";
const kTokenSecret =
  "UTFso3E/DRmrTVYe/rTRYB9/+pcxOkDgLQpM/W/giHCyIWZqhP3dTRUc3WhAlGmA0j/N8CCWgND";

const { Video } = new Mux(kTokenId, kTokenSecret);

exports.createLiveStream = functions.https.onCall(async (data, context) => {
  try {
    const response = await Video.LiveStreams.create({
      latency_mode: data.latency_mode || "standard",
      playback_policy: "public",
      new_asset_settings: { playback_policy: "public" },
    });
    return response;
  } catch (err) {
    console.error(
      `Unable to start the live stream ${context.auth.uid}. 
          Error ${err}`,
    );
    throw new functions.https.HttpsError(
      "aborted",
      "Could not create live stream",
    );
  }
});

exports.retrieveLiveStreams = functions.https.onCall(async (data, context) => {
  try {
    const liveStreams = await Video.LiveStreams.list();
    const responseList = liveStreams.map((liveStream) => ({
      id: liveStream.id,
      status: liveStream.status,
      playback_ids: liveStream.playback_ids,
      created_at: liveStream.created_at,
    }));
    return responseList;
  } catch (err) {
    console.error(
      `Unable to retrieve live streams. 
          Error ${err}`,
    );
    throw new functions.https.HttpsError(
      "aborted",
      "Could not retrieve live streams",
    );
  }
});

exports.retrieveLiveStream = functions.https.onCall(async (data, context) => {
  try {
    const liveStreamId = data.liveStreamId;
    const liveStream = await Video.LiveStreams.get(liveStreamId);
    return liveStream;
  } catch (err) {
    console.error(
      `Unable to retrieve live stream, id: ${data.liveStreamId}. 
          Error ${err}`,
    );
    throw new functions.https.HttpsError(
      "aborted",
      "Could not retrieve live stream",
    );
  }
});

exports.deleteLiveStream = functions.https.onCall(async (data, context) => {
  try {
    const liveStreamId = data.liveStreamId;
    const response = await Video.LiveStreams.del(liveStreamId);
    return response;
  } catch (err) {
    console.error(
      `Unable to delete live stream, id: ${data.liveStreamId}. 
        Error ${err}`,
    );
    throw new functions.https.HttpsError(
      "aborted",
      "Could not delete live stream",
    );
  }
});
const apiManager = require("./api_manager");
const { onRequest } = require("firebase-functions/v2/https");
const { setGlobalOptions } = require("firebase-functions/v2");
const { pipeline } = require("node:stream/promises");

setGlobalOptions({ region: "us-central1" });

exports.ffPrivateApiCall = functions
  .runWith({ minInstances: 1, timeoutSeconds: 120 })
  .https.onCall(async (data, context) => {
    try {
      console.log(`Making API call for ${data["callName"]}`);
      var response = await apiManager.makeApiCall(context, data);
      console.log(`Done making API Call! Status: ${response.statusCode}`);
      return response;
    } catch (err) {
      console.error(`Error performing API call: ${err}`);
      return {
        statusCode: 400,
        error: `${err}`,
      };
    }
  });

async function verifyAuthHeader(request) {
  const authorization = request.header("authorization");
  if (!authorization) {
    return null;
  }
  const idToken = authorization.includes("Bearer ")
    ? authorization.split("Bearer ")[1]
    : null;
  if (!idToken) {
    return null;
  }
  try {
    const authResult = await admin.auth().verifyIdToken(idToken);
    return authResult;
  } catch (err) {
    return null;
  }
}

exports.ffPrivateApiCallV2 = onRequest(
  { cors: true, minInstances: 1, timeoutSeconds: 120 },
  async (req, res) => {
    try {
      const context = {
        auth: await verifyAuthHeader(req),
      };
      const data = req.body.data;
      console.log(`Making API call for ${data["callName"]}`);
      var endpointResponse = await apiManager.makeApiCall(context, data);
      console.log(
        `Done making API Call! Status: ${endpointResponse.statusCode}`,
      );
      res.set(endpointResponse.headers);
      res.status(endpointResponse.statusCode);
      await pipeline(endpointResponse.body, res);
    } catch (err) {
      console.error(`Error performing API call: ${err}`);
      res.status(400).send(`${err}`);
    }
  },
);
exports.onUserDeleted = functions.auth.user().onDelete(async (user) => {
  let firestore = admin.firestore();
  let userRef = firestore.doc("users/" + user.uid);
  await firestore.collection("users").doc(user.uid).delete();
});

const path = require("path");
const axios = require("axios");

const missionPath = path.join(__dirname, "../dist/dcs-fiddle-mission.lua");

axios
  .post("http://127.0.0.1:7943/dofile", {
    path: missionPath,
    target: "mission",
  })
  .then(async (res) => {
    console.log("Deployed to DCS:", await res.data);
  })
  .catch((e) => console.error("Failed to deploy to DCS with error: ", e));

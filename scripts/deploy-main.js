const path = require("path");
const axios = require("axios");

const mainPath = path.join(__dirname, "../dist/dcs-fiddle-main.lua");

axios
  .post("http://127.0.0.1:7943/dofile", { path: mainPath, target: "gui" })
  .then(async (res) => {
    console.log("Deployed to DCS:", await res.data);
  })
  .catch((e) => console.error("Failed to deploy to DCS with error: ", e));

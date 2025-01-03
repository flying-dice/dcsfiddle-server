import { app } from "./app";
import { config } from "./config";
import { logger } from "./logger";

if (__dcs_fiddle_app !== undefined) {
  logger.info("Closing existing app");
  __dcs_fiddle_app.close();
}

logger.info("Starting app");
__dcs_fiddle_app = app;

DCS.setUserCallbacks({
  onSimulationFrame() {
    __dcs_fiddle_app.acceptNextClient();
  },
});

logger.info(
  `DCS Fiddle Listening on http://${config.bindAddress}:${config.port}/`,
);

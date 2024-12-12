import { logger } from "./logger";
import { config } from "./config";
import { app } from "./app";

if (__dcs_fiddle_app !== undefined) {
  logger.info("Closing existing app");
  __dcs_fiddle_app.close();
}

logger.info("Starting app");
__dcs_fiddle_app = app;

if (__dcs_fiddle_app_id !== undefined) {
  logger.info(`Removing existing function ${__dcs_fiddle_app}`);
  timer.removeFunction(__dcs_fiddle_app_id);
}

__dcs_fiddle_app_id = timer.scheduleFunction(
  () => {
    try {
      app.acceptNextClient();
    } catch (e) {
      env.error(`Error accepting client: ${e}`);
    }

    return (timer.getTime() as number) + 0.01;
  },
  [],
  (timer.getTime() as number) + 0.01,
);

logger.info(`Started server loop with functionId ${__dcs_fiddle_app}`);

logger.info(
  `DCS Fiddle Listening on http://${config.bindAddress}:${config.port}/`,
);

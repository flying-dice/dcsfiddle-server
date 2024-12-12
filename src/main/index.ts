import { app } from "./app";
import { config } from "./config";
import { logger } from "./logger";

if (__dcs_fiddle_app !== undefined) {
  logger.info("Closing existing app");
  __dcs_fiddle_app.close();
}

logger.info("Starting app");
__dcs_fiddle_app = app;

DCS?.setUserCallbacks({
  onSimulationStart() {
    logger.info("Simulation Started");

    logger.info("Starting DCS Fiddle Mission Server");
    const fiddleFile = `${lfs.writedir()}\\Scripts\\dcs-fiddle-mission.lua`;
    const [result] = string.gsub(fiddleFile, "\\", "/");
    const fiddleFileCommand = string.format(
      `a_do_script("dofile('%s')")`,
      result,
    );
    log.info(`Loading fiddle mission from ${fiddleFileCommand}`);

    net.dostring_in("mission", fiddleFileCommand);
  },
  onSimulationFrame() {
    __dcs_fiddle_app.acceptNextClient();
  },
});

logger.info(
  `DCS Fiddle Listening on http://${config.bindAddress}:${config.port}/`,
);

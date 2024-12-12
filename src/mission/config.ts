import { Logger, LogLevel } from "@flying-dice/tslua-common";

Logger.level = LogLevel.DEBUG;
Logger.transports = {
  trace: (message) => env.info(message),
  debug: (message) => env.info(message),
  info: (message) => env.info(message),
  warn: (message) => env.warning(message, true),
  error: (message) => env.error(message, true),
};

export const config = {
  bindAddress: "127.0.0.1",
  port: 12080,
};
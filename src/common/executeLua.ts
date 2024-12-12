import { Logger } from "@flying-dice/tslua-common";

export function executeLua(
  logger: Logger,
  luastring: string,
  env?: string,
): string {
  if (!env || env === "default") {
    logger.debug(`Executing Lua script: \n${luastring}`);
    const [result, err] = loadstring(luastring);

    if (err !== undefined) {
      logger.error(`Failed to load Lua script: ${err}`);
      throw new Error(typeof err === "string" ? err : err());
    }

    if (result === undefined) {
      logger.error("Failed to load Lua script, result is undefined");
      throw new Error("Failed to load Lua script, result is undefined");
    }

    logger.debug("Executing Lua script and returning result");
    return result() as string;
  }

  logger.debug(`Executing Lua script in environment: ${env}\n${luastring}`);
  const result = net.dostring_in(env, luastring);

  if (result === undefined) {
    logger.error("Failed to load Lua script, result is undefined");
    throw new Error("Failed to load Lua script, result is undefined");
  }

  logger.debug("Script executed successfully, returning result");
  return result as string;
}

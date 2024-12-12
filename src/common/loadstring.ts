import { decode } from "@flying-dice/tslua-base64";
import { executeLua } from "./executeLua";
import { AppMiddleware } from "@flying-dice/tslua-http-api";
import { Logger } from "@flying-dice/tslua-common";
import { HttpStatus } from "@flying-dice/tslua-http";

export const loadstringFromPath =
  (logger: Logger): AppMiddleware =>
  (req, res) => {
    try {
      logger.info(`Received loadstring request to be run in ${req.query.env}`);
      const base64EncodedLuaString = req.path.slice(1);
      logger.debug(`Encoded luastring:\n${base64EncodedLuaString}`);
      const luastring = decode(base64EncodedLuaString);
      logger.debug(`Decoded luastring:\n${luastring}`);
      const result = executeLua(logger, luastring, req.query.env);
      res.status(HttpStatus.OK).json({ result });
    } catch (e) {
      res.status(HttpStatus.OK).json({ error: e.toString() });
    }
  };

export const loadstringFromPost =
  (logger: Logger): AppMiddleware =>
  (req, res) => {
    try {
      logger.info(`Received loadstring request to be run in ${req.query.env}`);
      logger.debug(`Encoded luastring:\n${req.body}`);
      const luastring = decode(req.body);
      logger.debug(`Decoded luastring:\n${luastring}`);
      const result = executeLua(logger, luastring, req.query.env);
      res.status(HttpStatus.OK).json({ result });
    } catch (e) {
      res.status(HttpStatus.OK).json({ error: e.toString() });
    }
  };
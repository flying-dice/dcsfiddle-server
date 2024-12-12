import { AppErrorMiddleware } from "@flying-dice/tslua-http-api";

export const errorHandler: AppErrorMiddleware = (err, req, res) => {
  res.status(500).json({ error: err });
};
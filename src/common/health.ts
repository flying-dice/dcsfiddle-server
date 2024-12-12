import { AppMiddleware } from "@flying-dice/tslua-http-api";

export const health =
  ({
    version,
    environment,
  }: {
    version: string;
    environment: string;
  }): AppMiddleware =>
  (req, res) => {
    res.status(200).json({
      status: "OK",
      _VERSION,
      _APP_VERSION,
      _ARCHITECTURE,
      environment,
      version,
    });
  };

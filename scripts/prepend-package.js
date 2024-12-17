const { readFileSync, writeFileSync } = require("fs");
const { join } = require("path");

const buildPath = join(__dirname, "../dist/dcs-fiddle-mission.lua");
const header = `\
local _path = [[;.\\\\LuaSocket\\\\?.lua]]
local _cpath = [[;.\\\\LuaSocket\\\\?.dll]]
if not string.find(package.path, _path) then
  package.path = package.path .. _path
end
if not string.find(package.cpath, _cpath) then
  package.cpath = package.cpath .. _cpath
end

`;

const missionScript = readFileSync(
  buildPath,
  "utf8",
);
writeFileSync(
  buildPath,
  header + missionScript,
);

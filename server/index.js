import mongoose from "mongoose";
import express from "express";
import http from "http";
import { Server } from "socket.io";

const PORT = process.env.PORT || 3000;
const app = express();

//* Middleware
app.use(express.json());

const server = http.createServer(app);
const io = new Server(server);

io.on("connection", (socket) => {
  console.log("a user connected");
  socket.on("disconnect", () => {
    console.log("user disconnected");
  });
});

server.listen(PORT, async () => {
  console.log(`Server is listning at port: ${PORT}`);
  try {
    await mongoose.connect("mongodb://0.0.0.0:27017/tic_tac_toe");
    console.log("Successfully connected to mongooseDB");
  } catch (error) {
    console.log("Unable to connect to mongoose DB", error);
  }
});

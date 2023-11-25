import mongoose from "mongoose";
import express from "express";
import http from "http";
import { Server } from "socket.io";
import Room from "./models/room.js";

const PORT = process.env.PORT || 3000;
const app = express();

//* Middleware
app.use(express.json());

const server = http.createServer(app);
const io = new Server(server);

io.on("connection", (socket) => {
  console.log("Socket Connected successfully");

  socket.on("createRoom", async ({ nickname }) => {
    try {
      let player = {
        nickname: nickname,
        socketID: socket.id,
        playerType: "X",
      };
      var room = new Room();
      room.players.push(player);
      room.turn = player;
      const savedRoom = await room.save();
      const roomID = savedRoom._id.toString();

      socket.join(roomID);

      io.to(roomID).emit("createRoomSuccess", room);
    } catch (error) {
      console.log(error);
    }
  });

  socket.on("joinRoom", async ({ nickname, roomId }) => {
    try {
      if (!roomId.match(/^[0-9a-fA-F]{24}$/)) {
        socket.emit("errorOccured", "Please enter a valid room ID");
        return;
      }
      let room = await Room.findById(roomId);
      if (!room) {
        socket.emit("errorOccured", "Please enter a valid room ID");
        return;
      }

      if (room.isJoin) {
        const player = {
          nickname: nickname,
          playerType: "O",
          socketID: socket.id,
        };
        room.players.push(player);
        const joinedRoom = await room.save();
        socket.join(roomId);
        io.to(roomID).emit("joinRoomSuccess", joinedRoom);
      } else {
        return socket.emit(
          "errorOccured",
          "Game is in progress. Please Try again later"
        );
      }
    } catch (error) {
      console.log(error);
    }
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

import mongoose from "mongoose";
import playerSchema from "./player.js";


const roomSchema = new mongoose.Schema({
    occupancy: {
        type: Number,
        default: 2, 
    },
    maxRounds: {
        type: Number,
        default: 6,
    },
    currentRound: {
        type: Number,
        required: true,
        default: 1,
    },
    players: [playerSchema],
    isJoin: {
        type: Boolean,
        default: true,
    },
    turn: playerSchema,
    turnIndex: {
        type: Number,
        default: 0,
    },
});

const Room = mongoose.model('Room', roomSchema);

export default Room;
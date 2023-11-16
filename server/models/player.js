import mongoose from "mongoose";


const playerSchema = new mongoose.Schema({
    nickname: {
        type: String,
        required: true,
        trim: true,
    },
    socketID: {
        type: String,
        required: true,
    },
    points: {
        type: Number,
        default: 0,
    },
    playerType: {
        type: String,
        required: true,
    }
});

export default playerSchema;
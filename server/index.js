import express from 'express';
import mongoose from 'mongoose';


const PORT = process.env.PORT || 3000;

const app = express();


app.listen(PORT, async () => {
    console.log(`Server is listning at port: ${PORT}`);

        await mongoose.connect('mongodb://0.0.0.0:27017/tic_tac_toe');
        console.log('Successfully connected to mongooseDB');
    
});
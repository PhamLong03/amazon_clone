import { NextFunction, Request, Response } from 'express';
import jwt from 'jsonwebtoken';

const auth = async(req: Request, res: Response , next : NextFunction) => {
    try {
        const token = req.header('auth-token');
        const id = req.header('auth-id');

        if(!token) {
            return res.status(401).json({msg: 'msg - No auth token'})
        }

        const verified = jwt.verify(token, 'Long1234');

        if(!verified){
            return res.status(401).json({msg: 'msg - Token verification failed'});
        }
        req.body.user = id;
        req.body.token = token;
        next();
    } catch (error) {
        
    }
}

export default auth;
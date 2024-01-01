import React from 'react';
import { Route, Routes } from 'react-router-dom';

import Login from '../pages/login';
import RecoverPwd from '../pages/recoverpwd';
import Dashboard from '../pages/dashboard';

export default function Switch() {
  return (
    <Routes>
      <Route exact path="/login" element={<Login />}/>
      <Route exact path="/recoverPwd" element={<RecoverPwd/>}/>
      <Route exact path="/" element={<Dashboard/>}/>
    </Routes>
  );
}



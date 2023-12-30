import React from 'react'
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom'
import Login from '../pages/login';
import RecoverPwd from '../pages/recoverpwd';

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Login/>}/>
        <Route path="/recoverPwd" element={<RecoverPwd/>}/>
      </Routes>
    </Router>
  )
}

export default App
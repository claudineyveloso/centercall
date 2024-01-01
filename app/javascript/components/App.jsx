import React, { useContext } from 'react'
import { BrowserRouter as Router } from 'react-router-dom'
import RoutesSwitch from './routes';
import { AuthProvider } from '../context/AuthContext';
import history from './history';

function App() {
  
  console.log('Claudiney Veloso')
  return (
    <>
      <AuthProvider>
        <Router history={history}>
            <RoutesSwitch />
        </Router>
      </AuthProvider>
    </>
      

    
  )
}

export default App
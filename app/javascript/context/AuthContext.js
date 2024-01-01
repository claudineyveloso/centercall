import React, { createContext, useState, useEffect } from 'react';
import axios from 'axios';
import api from '../components/api'
import history from '../components/history';

const AuthContext = createContext();

function AuthProvider ({ children }) {
  const [authenticated, setAuthenticated] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const token = JSON.stringify(localStorage.getItem('voxxNettUseToken'));
    if (!token == null) {
      api.defaults.headers.Authorization = `Bearer ${JSON.parse(token)}`;
      setAuthenticated(true);
    } else {
      history.push('/login')
    }
    setLoading(false);  
  }, [])

  async function handleLogin(email, password) {
    const apiUrl = 'http://localhost:3000'
    const response = await axios.post(`${apiUrl}/api/v1/login`, { "user": { "email": email, "password": password }  })
     .then((response) => {
      const token = response.data.token
      localStorage.setItem('voxxNettUseToken', JSON.stringify(token));
      api.defaults.headers.Authorization = `Bearer ${token}`;
      console.log(response.data)
      history.push('/dashboard');
      setAuthenticated(true);
     }).catch(function(err) {
      console.log('Apresentação do erro', err);
      return err;
     })

    
    
    
  }

  function handleLogout() {
    setAuthenticated(false);
    localStorage.removeItem('voxxNettUseToken');
    api.defaults.headers.Authorization = undefined;
    history.push('/login');
  }




  return (
    <AuthContext.Provider value={{ authenticated, loading, handleLogin }}>
      {children}
    </AuthContext.Provider>
  );
};

export { AuthContext, AuthProvider };
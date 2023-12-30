import React, { useState, useContext } from "react";
import { Link } from "react-router-dom";
import { useForm } from 'react-hook-form';
import { z } from 'zod'
import { zodResolver } from '@hookform/resolvers/zod';
import axios from 'axios';
import AuthContext from "../../context/AuthProvider";

const createUserFormSchema = z.object({
  userName: z.string().nonempty('O usuário é obrigatório'),
  password: z.string().nonempty('A senha é obrigatório'),
})

function Login() {
  const { setAuth } = useContext(AuthContext);
  const [userName, setUserName] = useState('');
  const [password, setPassword] = useState('');

  const [output, setOutput] = useState('');
  const { register, handleSubmit, formState: {errors} } = useForm({
    resolver: zodResolver(createUserFormSchema)
  })

  async function createUser(data) {
    debugger
    const response = await axios.post('/api/v1/login', { "user": { "user_name": data.user_name, "password": data.password }  })
     .then((response) => {
      console.log(response.data)
      //setOutput(respponse.data.message)
     }).catch(function(err) {
      console.log('Apresentação do erro', err);
      return err;
     })
    
    //   console.log(response.data); 
    // setOutput(JSON.stringify(data, null, 2))
  }


  const handleSubmits = async (e) => {
    e.preventDefault();
    console.log(userName);
  }

  const togglePassword = () => {
    let togglePassword = document.getElementById("password-input");
    if (togglePassword.type === "password") {
      togglePassword.type = "text";
    } else {
      togglePassword.type = "password";
    }
  }

  return (
    <>
      <div className="authentication-bg min-vh-100">
        <div className="bg-overlay bg-light"></div>
        <div className="container">
          <div className="d-flex flex-column min-vh-100 px-3 pt-4">
            <div className="row justify-content-center my-auto">
              <div className="col-md-8 col-lg-6 col-xl-5">
                <div className="mb-4 pb-1">
                  <a href="/" className="d-block auth-logo">
                  </a>
                </div>
                <div className="card">
                  <div className="card-body p-4">
                    <div className="text-center mt-2">
                      <h5>Bem vindo(a)!</h5>
                      <p className="text-muted">Faça login para continuar no VoxxNett.</p>
                    </div>
                    <div className="p-2 mt-3">
                      <form onSubmit={handleSubmit(createUser)}>
                        <div className="mb-4">
                          <div className="position-relative input-custom-icon">
                            <input 
                              type="text"
                              className="form-control"
                              id="input-username" 
                              autoComplete='off'
                              placeholder="Usuário" 
                              {...register('userName')}
                            />
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="feather feather-user">
                              <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                              <circle cx="12" cy="7" r="4"></circle>
                            </svg>
                          </div>
                          <div className="invalid">
                            {errors.userName && <span>{errors.userName.message}</span>}
                          </div>
                        </div>
                        <div className="mb-1">
                          <div className="position-relative auth-pass-inputgroup input-custom-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="feather feather-lock mt-0">
                              <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                              <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                            </svg>
                            <input 
                              type="password"
                              className="form-control"
                              id="password-input" 
                              autoComplete='off'
                              placeholder="Senha" 
                              {...register('password')}
                            />
                            <button type="button" className="btn btn-link position-absolute h-100 end-0 top-0" id="password-addon" onClick={togglePassword}>
                              <i className="mdi mdi-eye-outline font-size-18 text-muted"></i>
                            </button>
                          </div>
                          <div className="invalid">
                            {errors.password && <span>{errors.password.message}</span>}
                          </div>
                        </div>
                        <div className="mt-4">
                          <Link
                            to={"/recoverPwd"}
                            className="text-muted text-decoration-underline"
                            role="button"
                          >
                            Esqueceu a senha?
                          </Link>
                        </div>
                        <div className="mt-4">
                          <button className="btn btn-primary w-100 waves-effect waves-light" type="submit">Entrar</button>
                          {/* <%= f.submit "Entrar", className: "btn btn-primary w-100 waves-effect waves-light" %> */}
                        </div>
                      </form>
                      <pre>{output}</pre>
                    </div>
                  </div>
                </div>
              </div>
              {/* <!-- end col --> */}
            </div>
            {/* <!-- end row --> */}
            <div className="row">
              <div className="col-lg-12">
                <div className="text-center p-4">
                  <p>
                    © 2023 VoxxNett - Desenvolvido por AIC - Consultoria e Sistemas Ltda.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
        {/* <!-- end container --> */}
      </div>
    </>
  );
}

export default Login;

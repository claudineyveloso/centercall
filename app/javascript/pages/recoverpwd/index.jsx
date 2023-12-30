import React, { useState } from "react";
import { Link } from "react-router-dom";

function RecoverPwd() {
  const [email, setEmail] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    console.log(email);
  }
  // const data = JSON.stringify({
  //   "user": {
  //     "email": email,
  //     "password": password
  //   }
  // });


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
                      <h5>Redefinir senha</h5>
                      <p className="text-muted">Redefinir senha para VoxxNett.</p>
                    </div>
                    <div className="p-2 mt-3">
                      <div className="alert alert-success text-center small mb-4" role="alert">
                        Digite o e-mail as instruções serão enviadas para você!
                      </div>
                      <form action="index.html">
                        <div className="mb-3">
                          <label className="form-label" htmlFor="useremail">Email</label>
                          <div className="position-relative input-custom-icon">
                            <input 
                              type="email"
                              className="form-control"
                              id="user-email" 
                              autoComplete='off'
                              placeholder="Email" 
                              onChange={(e) => setEmail(e.target.value)}
                              defaultValue={email}
                            />

                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="feather feather-mail">
                              <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                              <polyline points="22,6 12,13 2,6"></polyline>
                            </svg>
                          </div>
                        </div>
                        <div className="mt-4">
                          <button className="btn btn-primary w-100 waves-effect waves-light" type="submit">Redefinir</button>
                        </div>
                        <div className="mt-4 text-center">
                          <p className="mb-0">Lembrou a senha? 
                            <Link
                              to={"/"}
                              className="text-muted text-decoration-underline ms-2"
                              role="button"
                            >
                            Entrar
                          </Link>
                          </p>
                        </div>
                      </form>
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

export default RecoverPwd;

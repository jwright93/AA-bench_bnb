import React from 'react';
import ReactDOM from 'react-dom';
import * as API from './util/session_api_util';
document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<h1>Welcome to BenchBnb</h1>, root);

  window.signUp = API.signUp;
  window.login = API.login;
  window.logout = API.logout;
});

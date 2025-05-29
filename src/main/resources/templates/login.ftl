<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <style>
    body {
      background-color: #000;
      color: #FFD700;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
    }

    .wrapper {
      transform: translateX(-100vw);
      transition: transform 1s ease;
      border-radius:10px;
    }

    .wrapper.show {
      transform: translateX(0);
    }

 .wrapper.show:hover {
      box-shadow: 0 0 15px rgba(255,215,0,0.8);
      transition: box-shadow 0.5s ease;
    }
    .login-container {
      background-color: #111;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(255, 215, 0, 0.0);
      width: 400px;
    }


    h2 {
      color: #FFD700;
      text-align: center;
      margin-bottom: 20px;
    }

    label {
      display: block;
      margin-bottom: 8px;
      color: #FFD700;
      font-weight: bold;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #FFD700;
      border-radius: 4px;
      background-color: #222;
      color: #FFD700;
    }

    input::placeholder {
      color: #ccc;
    }

    button[type="submit"] {
      background: linear-gradient(145deg, #FFD700, #B8860B);
      color: #000;
      padding: 12px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      width: 100%;
      font-size: 16px;
      font-weight: bold;
      box-shadow: 0 0 10px #FFD700;
    }

    button[type="submit"]:hover {
      background: linear-gradient(145deg, #FFFACD, #DAA520);
      box-shadow: 0 0 15px #FFD700;
    }

    p.error-message {
      color: #ff4f4f;
      margin-top: 10px;
      text-align: center;
    }

    .login-footer {
      text-align: center;
      margin-top: 15px;
    }

    .login-footer a {
      color: #FFD700;
      text-decoration: none;
    }

    .login-footer a:hover {
      text-decoration: underline;
      color: #fffacd;
    }
  </style>
</head>
<body>
  <div class="wrapper">
    <div class="login-container">
      <h2>Login</h2>
      <form action="/login" method="post">
        <div class="mb-3">
          <label for="username" class="form-label">Email:</label>
          <input type="text" class="form-control" id="username" name="username" placeholder="Enter your email" required>
        </div>
        <div class="mb-3">
          <label for="password" class="form-label">Password:</label>
          <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </div>
        <button type="submit">Login</button>
      </form>
      <div class="login-footer">
        <a href="/register">Create new account</a>
      </div>
      <#if error??>
        <p class="error-message">Invalid details</p>
      </#if>
    </div>
  </div>

  <script>
    $(document).ready(function () {
      setTimeout(function () {
        $(".wrapper").addClass("show");
      }, 200);
    });
  </script>
</body>
</html>

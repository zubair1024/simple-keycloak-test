<#-- <#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=social.displayInfo; section>
        <#if section="title">
            ${msg("loginTitle",(realm.displayName!''))}
            <#elseif section="header">
                ${msg("loginTitleHtml",(realm.displayNameHtml!''))?no_esc}
                <#elseif section="form">
                    <div id="kc-form">
                        <div id="kc-form-wrapper">
                            <#if realm.password>
                                <h1>Hello world</h1>
                                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                                    <div class="form-group">
                                        <label for="username" class="${properties.kcLabelClass!}">
                                            ${msg("username")}
                                        </label>
                                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" />
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="${properties.kcLabelClass!}">
                                            ${msg("password")}
                                        </label>
                                        <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" />
                                    </div>
                                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                        <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}" />
                                    </div>
                                </form>
                            </#if>
                        </div>
                    </div>
        </#if>
    </@layout.registrationLayout> -->
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Archivo:ital,wght@0,100..900;1,100..900&display=swap"
            rel="stylesheet" />
        <style>
        body {
            background-color: #eee;
            min-height: 100%;
            font-family: "Archivo", sans-serif;
            margin: 0;
        }

        h2 {
            font-family: archivo;
            font-size: 20px;
            font-style: normal;
            font-weight: 500;
            letter-spacing: 0.5px;
        }

        p {
            font-family: archivo;
            font-size: 16px;
            font-style: normal;
            font-weight: 400;
            letter-spacing: 0.5px;
        }

        a {
            font-family: archivo;
            font-size: 15px;
            text-decoration: none;
            color: #3667ce;
            font-weight: 400;
            letter-spacing: 0.5px;
        }

        .container {
            display: grid;
            font-family: "Archivo", sans-serif;
            grid-template-columns: 1fr 1fr;
            height: 100vh;
        }

        .login-container {
            font-family: "Archivo", sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-card {
            font-family: "Archivo", sans-serif;
            color: rgba(82, 82, 82, 1);
            font-size: 18px;
            font-style: normal;
            font-weight: 600;
            max-width: 350px;
            display: flex;
            flex-direction: column;
            /* align-items: left; */
            width: 300px;
            height: 600px;
            gap: 20px;
            background-color: white;
            border-radius: 24px;
            padding: 47px 58px;
            filter: drop-shadow(0px 2.846px 49.802px rgba(0, 0, 0, 0.1));
            backdrop-filter: blur(10.671875px);
        }

        .Logo img {
            height: 35px;
            width: auto;
        }

        .input-group {
            position: relative;
            display: flex;
            flex-direction: column;
            color: #7e7e7e;
            font-size: 16px;
            font-weight: 200;
            gap: 8px;
        }

        .input-icon {
            position: absolute;
            left: 12px;
            top: 36px;
        }

        .input-group>input {
            height: 40px;
            /* line-height: 40px; */
            /* color: #7E7E7E; */
            border-radius: 4px;
            border: 1px solid rgba(0, 0, 0, 0.1);
            padding: 0 12px 0 40px;
            box-sizing: border-box;
        }

        input::placeholder {
            font-family: archivo;
            color: #c5c5c5;
            font-size: 14px;
            font-weight: 50;
        }

        .actions {
            color: #c5c5c5;
            font-family: archivo;
            padding-top: 10px;
            display: flex;
            /* width: 336px; */
            justify-content: space-between;
            /* gap: 80px; */
        }

        .primary-button {
            background-color: #3667ce;
            color: white;
            padding: 16px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-size: 14px;
            font-family: archivo;
            transition: background-color 0.3s ease;
        }

        .primary-button:hover {
            background-color: #1340a0 !important;
        }

        .social-login {
            display: flex;
            flex-direction: column;
        }

        .microsoft-login {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #ffffff;
            color: black;
            padding: 14px;
            border: 1px solid var(--black-5, rgba(0, 0, 0, 0.05));
            border-radius: 30px;
            cursor: pointer;
            font-size: 14px;
            font-family: archivo;
            transition: background-color 0.3s ease;
            width: 100%;
            max-width: 100%;
        }

        .microsoft-login img {
            height: 17 px;
            width: 80px;
            /* margin-right: 10px; */
        }

        .microsoft-login:hover {
            background-color: #ececec !important;
        }

        @media (max-width: 768px) {
            .container {
                grid-template-columns: 1fr;
            }

            .animation-container {
                display: none;
            }
        }

        .animation-container {
            position: relative;
            overflow: hidden;
        }

        .animation-items {
            position: absolute;
            right: 0;
            top: 0;
            bottom: 0;
            /* width: 50%; */
        }

        .circle-one,
        .circle-two,
        .circle-three {
            position: absolute;
            border-radius: 50%;
            right: -50%;
            /* transform: translateY(-50%); */
            /* animation: swingIn 2s ease-out forwards; */
        }

        .circle-one {
            width: 100vh;
            height: 100vh;
            background-color: rgba(54, 103, 206, 0.17);
            transform: translate(56%, -19%);
            animation: swingIn1 2s ease-out forwards;
        }

        .circle-two {
            width: 66.6vh;
            height: 66.6vh;
            background-color: rgba(54, 103, 206, 0.15);
            transform: translate(54%, -8%);
            animation: swingIn2 2s ease-out forwards;
        }

        /* .circle-three {
        width: 92vh;
        height: 92vh;
        background: linear-gradient(
          to bottom,
          rgba(54, 103, 206, 1),
          rgb(4, 30, 84)
        );
        transform: translate(55%, 11%);
        animation: swingIn3 2s ease-out forwards;
      } */
        .img-container {
            position: absolute;
            top: 50%;
            right: 50%;
            z-index: 1;
            transform: translate(97%, -44%);
            animation: swingIn4 2s ease-out forwards;
        }

        .img-container img {
            /* box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.25); /* Adding a shadow */
            /* border-radius: 12px; Optional: Adding rounded corners */
        }

        @keyframes swingIn1 {
            0% {
                transform: translate(100%, -100%);
            }

            100% {
                transform: translate(56%, -19%);
            }
        }

        @keyframes swingIn2 {
            0% {
                transform: translate(100%, -100%);
            }

            100% {
                transform: translate(54%, -8%);
            }
        }

        /* @keyframes swingIn3 {
        0% {
          transform: translate(100%, -100%);
        }
        100% {
          transform: translate(55%, 11%);
        }
      } */
        @keyframes swingIn4 {
            0% {
                transform: translate(500%, -500%);
            }

            100% {
                transform: translate(97%, -44%);
            }
        }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="login-container">
                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <div class="login-card">
                        <div class="Logo"><img src="${url.resourcesPath}/img/BEWOTEC_Logo.png" /></div>
                        <h2>Login to DaVinci NT</h2>
                        <div class="input-group">
                            <label for="Username">Username</label>
                            <span class="input-icon">
                                <img src="${url.resourcesPath}/img/account_circle.svg" alt="User Icon" />
                            </span>
                            <input
                                type="text"
                                id="Username"
                                name="Username"
                                value="${(login.username!'')}"
                                placeholder="joe@example.com" />
                        </div>
                        <div class="input-group">
                            <label for="password">Password</label>
                            <span class="input-icon">
                                <img src="${url.resourcesPath}/img/password.svg" alt="password" />
                            </span>
                            <input
                                type="password"
                                id="password"
                                name="password"
                                placeholder="Password" />
                            <div class="actions">
                                <label><input type="checkbox" name="remember" />Remember me</label>
                                <a href="#" class="forgot-password">Forgot Password</a>
                            </div>
                        </div>
                        <button class="primary-button" type="submit" id="kc-login" type="submit">Sign in</button>
                        <div class="social-login">
                            <p>Or sign in with</p>
                            <button class="microsoft-login">
                                <img src="${url.resourcesPath}/img/microsoft-logo-black-and-white.png" />
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="animation-container">
                <div class="img-container">
                    <img src="${url.resourcesPath}/img/boat+plane5.png" height="700px" alt="" />
                </div>
                <div class="animation-items">
                    <div class="circle-one"></div>
                    <div class="circle-two"></div>
                    <!-- <div class="circle-three"></div> -->
                </div>
            </div>
        </div>
        <script>
        document.addEventListener("DOMContentLoaded", function() {
            new Animate(document.getElementById("canvas"));
        });
        </script>
    </body>

    </html>
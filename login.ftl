<#import "template.ftl" as layout>
    <@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
        <#if section="header">
            <#elseif section="form">
                <div class="container">
                    <div class="login-container">
                        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                            <div class="login-card">
                                <div class="Logo"><img src="${url.resourcesPath}/img/BEWOTEC_Logo.png" alt="BEWOTEC Logo" /></div>
                                <h2>Login to DaVinci NT</h2>
                                <div class="input-group">
                                    <label for="username">
                                        ${msg("username")}
                                    </label>
                                    <span class="input-icon">
                                        <img src="${url.resourcesPath}/img/account_circle.svg" alt="User Icon" />
                                    </span>
                                    <input
                                        type="text"
                                        id="username"
                                        name="username"
                                        value="${(login.username!'')}"
                                        placeholder="joe@example.com"
                                        autocomplete="off" />
                                </div>
                                <div class="input-group">
                                    <label for="password">
                                        ${msg("password")}
                                    </label>
                                    <span class="input-icon">
                                        <img src="${url.resourcesPath}/img/password.svg" alt="password" />
                                    </span>
                                    <input
                                        type="password"
                                        id="password"
                                        name="password"
                                        autocomplete="off"
                                        placeholder="${msg("password")}" />
                                    <div class="actions">
                                        <label><input type="checkbox" name="rememberMe" />
                                            ${msg("rememberMe")}
                                        </label>
                                        <#if realm.resetPasswordAllowed>
                                            <a href="${url.loginResetCredentialsUrl}">
                                                ${msg("doForgotPassword")}
                                            </a>
                                        </#if>
                                    </div>
                                </div>
                                <input class="primary-button" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}" />
                                <div class="social-login">
                                    <p>Or sign in with</p>
                                    <button class="microsoft-login" type="button" onclick="location.href='${url.loginUrl}&kc_idp_hint=microsoft'">
                                        <img src="${url.resourcesPath}/img/microsoft-logo-black-and-white.png" alt="Microsoft logo" />
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="animation-container">
                        <#-- <div class="img-container">
                            <img src="${url.resourcesPath}/img/boat+plane5.png" height="700px" alt="" />
                    </div> -->
                    <div class="animation-items">
                        <div class="circle-one"></div>
                        <div class="circle-two"></div>
                        <div class="circle-three"></div>
                    </div>
                </div>
                </div>
                <#elseif section="info">
                    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                        <div id="kc-registration">
                            <span>
                                ${msg("noAccount")}
                                <a tabindex="6" href="${url.registrationUrl}">
                                    ${msg("doRegister")}
                                </a></span>
                        </div>
                    </#if>
        </#if>
    </@layout.registrationLayout>
<#import "template.ftl" as layout>
    <@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
        <#if section="header">
            <script>
            document.addEventListener("DOMContentLoaded", function() {
                new Animate(document.getElementById("canvas"));
            });
            </script>
            <#elseif section="form">
                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <div class="login-card">
                        <div class="Logo"><img src="${url.resourcesPath}/img/BEWOTEC_Logo.png" alt="BEWOTEC Logo" /></div>
                        <h2>
                            ${msg("loginTitle",(realm.displayName!''))}
                        </h2>
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
                            <#if messagesPerField.existsError('username')>
                                <span id="input-error-username" class="${properties.kcInputErrorMessageClass!} error-message" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                </span>
                            </#if>
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
                            <button type="button" id="togglePassword" class="toggle-password">
                                <i id="toggleIcon" class="fa fa-eye"></i>
                            </button>
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
                            <#-- <button class="microsoft-login" type="button" onclick="location.href='${url.loginUrl}&kc_idp_hint=microsoft'">
                                <img src="${url.resourcesPath}/img/microsoft-logo-black-and-white.png" alt="Microsoft logo" />
                                </button> -->
                                <#if social.providers??>
                                    <div class="social-login">
                                        <p>Or sign in with</p>
                                        <div id="social-providers">
                                            <#list social.providers as p>
                                                <button class="${p.alias}-login" type="button" onclick="location.href='${p.loginUrl}';">
                                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                                    <span>
                                                        ${p.displayName}
                                                    </span>
                                                </button>
                                            </#list>
                                        </div>
                                    </div>
                                </#if>
                        </div>
                    </div>
                </form>
                <#elseif section="info">
                    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                        <div id="kc-registration">
                            <span>
                                <#-- ${msg("noAccount")} -->
                                    <a tabindex="6" href="${url.registrationUrl}">
                                        <#-- ${msg("doRegister")} -->
                                    </a>
                            </span>
                        </div>
                    </#if>
        </#if>
        <script>
        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#password');
        const toggleIcon = document.querySelector('#toggleIcon');
        togglePassword.addEventListener('click', function() {
            // Toggle the type attribute
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            // Toggle the eye slash icon
            toggleIcon.classList.toggle('fa-eye-slash');
            toggleIcon.classList.toggle('fa-eye');
        });
        </script>
    </@layout.registrationLayout>
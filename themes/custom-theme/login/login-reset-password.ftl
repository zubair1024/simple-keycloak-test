    <#import "template.ftl" as layout>
        <@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
            <#if section="header">
                ${msg("emailForgotTitle")}
                <#elseif section="form">
                    <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                        <div class="login-card">
                            <div class="Logo">
                                <img src="${url.resourcesPath}/img/BEWOTEC_Logo.png" alt="Logo" />
                            </div>
                            <h2>
                                ${msg("emailForgotTitle")}
                            </h2>
                            <div class="login-card-content">
                                <#if realm.loginWithEmailAllowed>
                                    ${msg("emailInstruction")}
                                    <#else>
                                        ${msg("usernameInstruction")}
                                </#if>
                            </div>
                            <div class="input-group">
                                <label for="username">
                                    <#if realm.loginWithEmailAllowed>
                                        ${msg("usernameOrEmail")}
                                        <#else>
                                            ${msg("username")}
                                    </#if>
                                </label>
                                <span class="input-icon">
                                    <img src="${url.resourcesPath}/img/account_circle.svg" alt="User Icon" />
                                </span>
                                <input
                                    type="text"
                                    id="username"
                                    name="username"
                                    class="${properties.kcInputClass!}"
                                    autofocus
                                    autocomplete="off"
                                    value="${(auth.attemptedUsername!'')}"
                                    aria-invalid="<#if messagesPerField.existsError('username')>true</#if>" />
                                <#if messagesPerField.existsError('username')>
                                    <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                    </span>
                                </#if>
                            </div>
                            <button class="primary-button" type="submit">
                                ${msg("doSubmit")}
                            </button>
                        </div>
                    </form>
                    <#elseif section="info">
            </#if>
        </@layout.registrationLayout>
<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
        <#if section="header">
            ${msg("emailForgotTitle")}
            <#elseif section="form">
                <div class="container">
                    <div class="login-container">
                        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                            <div class="login-card">
                                <div class="Logo">
                                    <img src="${url.resourcesPath}/img/BEWOTEC_Logo.png" alt="Logo" />
                                </div>
                                <h2>
                                    ${msg("emailForgotTitle")}
                                </h2>
                                <div class="login-card-content">
                                    ${msg("emailInstruction")}
                                </div>
                                <div class="input-group">
                                    <label for="username">
                                        ${msg("usernameOrEmail")}
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
                                        value="${(auth.attemptedUsername!'')}"
                                        aria-invalid="<#if messagesPerField.existsError('username')>true</#if>" />
                                    <#if messagesPerField.existsError('username')>
                                        <span id="input-error-username" class="${properties.kcInputErrorMessageClass!} error-message" aria-live="polite">
                                            ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                        </span>
                                    </#if>
                                </div>
                                <button class="primary-button" type="submit">
                                    ${msg("doSubmit")}
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="animation-container">
                        <div class="animation-items">
                            <div class="circle-one"></div>
                            <div class="circle-two"></div>
                            <div class="circle-three"></div>
                        </div>
                    </div>
                </div>
                <#elseif section="info">
                    <#if realm.duplicateEmailsAllowed>
                        ${msg("emailInstructionUsername")}
                        <#else>
                            ${msg("emailInstruction")}
                    </#if>
        </#if>
    </@layout.registrationLayout>
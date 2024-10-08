<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=true; section>
        <#if section="header">
            ${msg("doLogIn")}
            <#elseif section="form">
                <form id="kc-otp-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="login-card">
                        <div class="Logo"><img src="${url.resourcesPath}/img/BEWOTEC_Logo.png" alt="Logo" /></div>
                        <h2>
                            ${msg("emailAuthTitle")}
                        </h2>
                        <div class="user-info">
                            <i class="fas fa-user"></i>
                            <span class="username">
                                ${(auth.attemptedUsername!'')}
                            </span>
                            <a href="${url.loginRestartFlowUrl}" class="edit-icon"><i class="fas fa-edit"></i></a>
                        </div>
                        <div class="input-group">
                            <label for="otp">
                                ${msg("loginOtpOneTime")}
                            </label>
                            <input type="text" id="otp" name="otp" autofocus autocomplete="off"
                                class="${properties.kcInputClass!}"
                                aria-invalid="<#if messagesPerField.existsError('totp')>true</#if>" />
                            <#if messagesPerField.existsError('totp')>
                                <span id="input-error-otp" class="${properties.kcInputErrorMessageClass!} error-message" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('totp'))?no_esc}
                                </span>
                            </#if>
                        </div>
                        <div class="actions">
                            <label>
                                <input type="checkbox" id="registerTrustedDevice" name="register-trusted-device"
                                    ${(rememberMe!false)?string('checked', '')} />
                                ${msg("trustThisDevice")}
                            </label>
                        </div>
                        <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"
        </#if>/>
        <button class="primary-button" type="submit">
            ${msg("doLogIn")}
        </button>
        </div>
        </form>
        <#elseif section="info">
            <#-- ${msg("emailInstruction")} -->
                </#if>
    </@layout.registrationLayout>
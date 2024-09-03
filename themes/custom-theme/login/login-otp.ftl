<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=true; section>
        <#if section="header">
            ${msg("doLogIn")}
            <#elseif section="form">
                <div class="container">
                    <div class="login-container">
                        <form id="kc-otp-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                            <div class="login-card">
                                <div class="Logo"><img src="${url.resourcesPath}/img/BEWOTEC_Logo.png" alt="Logo" /></div>
                                <h2>
                                    <#-- ${msg("doLogIn")} -->
                                        OTP Code
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
                                        <#-- ${msg("enterEmailCode")} -->
                                            Email Code
                                    </label>
                                    <input type="text" id="otp" name="otp" autofocus autocomplete="off"
                                        class="${properties.kcInputClass!}"
                                        aria-invalid="<#if messagesPerField.existsError('totp')>true</#if>" />
                                    <#if messagesPerField.existsError('totp')>
                                        <span id="input-error-otp" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                            ${kcSanitize(messagesPerField.get('totp'))?no_esc}
                                        </span>
                                    </#if>
                                </div>
                                <div class="actions">
                                    <label>
                                        <input type="checkbox" id="rememberMe" name="rememberMe" ${(rememberMe!false)?string('checked', '')} />
                                        <#-- ${msg("rememberMe")} --> Trust this device
                                    </label>
                                </div>
                                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"
        </#if>/>
        <button class="primary-button" type="submit">
            ${msg("doLogIn")}
        </button>
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
            ${msg("emailInstruction")}
            </#if>
    </@layout.registrationLayout>
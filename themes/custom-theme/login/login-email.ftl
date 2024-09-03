<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=true; section>
        <#if section="header">
            ${msg("doLogIn")}
            <#elseif section="form">
                <div class="container">
                    <div class="login-container">
                        <form id="kc-email-code-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                            <div class="login-card">
                                <div class="Logo"><img src="${url.resourcesPath}/img/BEWOTEC_Logo.png" alt="Logo" /></div>
                                <h2>OTP Code</h2>
                                <div class="user-info">
                                    <i class="fas fa-user"></i>
                                    <span class="username">
                                        ${(auth.attemptedUsername!'')}
                                    </span>
                                    <a href="${url.loginRestartFlowUrl}" class="edit-icon"><i class="fas fa-edit"></i></a>
                                </div>
                                <div class="input-group">
                                    <label for="code">Email Code</label>
                                    <input type="text" id="code" name="code" autofocus autocomplete="off"
                                        class="${properties.kcInputClass!}"
                                        aria-invalid="<#if messagesPerField.existsError('code')>true</#if>" />
                                    <#if messagesPerField.existsError('code')>
                                        <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                            ${kcSanitize(messagesPerField.get('code'))?no_esc}
                                        </span>
                                    </#if>
                                </div>
                                <div class="actions">
                                    <label>
                                        <input type="checkbox" id="rememberMe" name="rememberMe"
                                            <#if (login.registerTrustedDevice)?? && login.registerTrustedDevice>checked
        </#if> />
        Trust this device
        </label>
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
            ${msg("emailCodeInstruction")}
            </#if>
    </@layout.registrationLayout>
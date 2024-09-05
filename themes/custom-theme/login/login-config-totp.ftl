<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=true; section>
        <#if section="header">
            ${msg("configureOTPTitle")}
            <#elseif section="form">
                <form id="kc-otp-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="login-card">
                        <div class="Logo">
                            <img src="${url.resourcesPath}/img/BEWOTEC_Logo.png" alt="Logo" />
                        </div>
                        <h2>
                            ${msg("configureOTPTitle")}
                        </h2>
                        <div class="login-card-content" style="font-size: 16px;">
                            ${msg("configureOTPIntro")}
                        </div>
                        <div class="qr-code">
                            <img id="kc-totp-secret-qr-code" src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"><br />
                        </div>
                        <div class="manual-setup">
                            <p>
                                ${msg("manualSetupIntro")}
                            </p>
                            <code>
                                ${totp.totpSecretEncoded}
                            </code>
                        </div>
                        <div class="input-group">
                            <label for="totp" class="${properties.kcLabelClass!}">
                                ${msg("enterOTPCode")}
                            </label>
                            <input type="text" id="totp" name="totp" autocomplete="off"
                                class="${properties.kcInputClass!}"
                                aria-invalid="<#if messagesPerField.existsError('totp')>true</#if>" />
                            <#if messagesPerField.existsError('totp')>
                                <span id="input-error-otp-code" class="${properties.kcInputErrorMessageClass!} error-message" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('totp'))?no_esc}
                                </span>
                            </#if>
                        </div>
                        <div class="input-group">
                            <label for="userLabel" class="${properties.kcLabelClass!}">
                                ${msg("otpDeviceName")}
                            </label>
                            <input type="text" id="userLabel" name="userLabel" autocomplete="off"
                                class="${properties.kcInputClass!}"
                                aria-invalid="<#if messagesPerField.existsError('userLabel')>true</#if>" />
                            <#if messagesPerField.existsError('userLabel')>
                                <span id="input-error-user-label" class="${properties.kcInputErrorMessageClass!} error-message" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('userLabel'))?no_esc}
                                </span>
                            </#if>
                        </div>
                        <div>
                            <input type="checkbox" id="logout-sessions" name="logout-sessions" value="on" checked>
                            <label style="font-weight: 100; font-size: 16px;" for="logout-sessions">
                                ${msg("logoutOtherSessions")}
                            </label>
                        </div>
                        <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
                        <button class="primary-button" type="submit">
                            ${msg("doSubmit")}
                        </button>
                    </div>
                </form>
                <#elseif section="info">
                    <#-- ${msg("configureOTPExplanation")} -->
        </#if>
    </@layout.registrationLayout>
<#import "template.ftl" as layout>
    <@layout.registrationLayout
        displayMessage=!messagesPerField.existsError('username','password')
        displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??;
        section>
        <#assign showLoginForm=true>
            <#if section="header">
                ${msg("loginAccountTitle")}
                <#elseif section="form">
                    <div id="kc-form">
                        <div id="kc-form-wrapper">
                            <#if realm.password && showLoginForm>
                                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                                    <#if !usernameHidden??>
                                        <div class="${properties.kcFormGroupClass!}">
                                            <label for="username" class="${properties.kcLabelClass!}">
                                                <#if !realm.loginWithEmailAllowed>
                                                    ${msg("username")}
                                                    <#elseif !realm.registrationEmailAsUsername>
                                                        ${msg("usernameOrEmail")}
                                                        <#else>
                                                            ${msg("email")}
                                                </#if>
                                            </label>
                                            <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off"
                                                aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
                                            <#if messagesPerField.existsError('username','password')>
                                                <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                                </span>
                                            </#if>
                                        </div>
                                    </#if>
                                    <div class="${properties.kcFormGroupClass!} no-bottom-margin">
                                        <hr />
                                        <label for="password" class="${properties.kcLabelClass!}">
                                            ${msg("password")}
                                        </label>
                                        <div class="${properties.kcInputGroup!}">
                                            <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password"
                                                type="password" autocomplete="on" autofocus
                                                aria-invalid="<#if messagesPerField.existsError('password')>true</#if>" />
                                            <button class="${properties.kcFormPasswordVisibilityButtonClass!}" type="button" aria-label="${msg('showPassword')}"
                                                aria-controls="password" data-password-toggle
                                                data-icon-show="${properties.kcFormPasswordVisibilityIconShow!}" data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!}"
                                                data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                                                <i class="${properties.kcFormPasswordVisibilityIconShow!}" aria-hidden="true"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <#if friendlyCaptchaEnabled??>
                                        <!-- friendly-captcha integration -->
                                        <script type="module" src="${friendlyCaptchaSourceModule}" async="" defer="" class=""></script>
                                        <script nomodule="" src="${friendlyCaptchaSourceNoModule}" async="" defer=""></script>
                                        <#-- See: https://docs.friendlycaptcha.com/#/widget_api?id=attribute-api-html-tags -->
                                            <div class="frc-captcha"
                                                data-sitekey="${friendlyCaptchaSiteKey}"
                                                data-start="${friendlyCaptchaStart}"
                                                data-lang="${friendlyCaptchaLang}"
                                                data-solution-field-name="${friendlyCaptchaSolutionFieldName}"
                                                data-callback="captchaSolvedCallback"></div>
                                            <script defer>
                                            function captchaSolvedCallback(solution) {
                                                let btnKcLogin = document.getElementById("kc-login");
                                                btnKcLogin.disabled = false;
                                            }
                                            </script>
                                    </#if>
                                    <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                                        <div id="kc-form-options">
                                            <#if realm.rememberMe && !usernameHidden??>
                                                <div class="checkbox">
                                                    <label>
                                                        <#if login.rememberMe??>
                                                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked>
                                                            ${msg("rememberMe")}
                                                            <#else>
                                                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox">
                                                                ${msg("rememberMe")}
                                                        </#if>
                                                    </label>
                                                </div>
                                            </#if>
                                        </div>
                                        <div class="${properties.kcFormOptionsWrapperClass!}">
                                            <#if realm.resetPasswordAllowed>
                                                <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">
                                                        ${msg("doForgotPassword")}
                                                    </a></span>
                                            </#if>
                                        </div>
                                    </div>
                                    <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                                        <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"
                            </#if>/>
                            <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                                name="login"
                                id="kc-login"
                                type="submit"
                                <#if friendlyCaptchaEnabled??>disabled=""
            </#if>
            value="${msg("doLogIn")}"/>
            </div>
            </form>
            </#if>
            </div>
            </div>
            <#elseif section="idpList">
                <div id="kc-idplist">
                    <div id="kc-idplist-wrapper">
                        <#if realm.password && social.providers??>
                            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                                <hr />
                                <#if showLoginForm>
                                    <h4>
                                        ${msg("identity-provider-login-label")}
                                    </h4>
                                </#if>
                                <ul class="${properties.kcFormSocialAccountListClass!}
<#if social.providers?size gt 3>
${properties.kcFormSocialAccountListGridClass!}
</#if>">
                                    <#list social.providers as p>
                                        <a id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!}
<#if social.providers?size gt 3>
${properties.kcFormSocialAccountGridItem!}
</#if>"
                                            type="button" href="${p.loginUrl}">
                                            <#if p.iconClasses?has_content>
                                                <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                                <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">
                                                    ${p.displayName!}
                                                </span>
                                                <#else>
                                                    <span class="${properties.kcFormSocialAccountNameClass!}">
                                                        ${p.displayName!}
                                                    </span>
                                            </#if>
                                        </a>
                                    </#list>
                                </ul>
                            </div>
                        </#if>
                    </div>
                </div>
                <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>
                <#elseif section="info">
                    <#if realm.password && realm.registrationAllowed && !registrationDisabled?? && showLoginForm>
                        <div id="kc-registration-container">
                            <div id="kc-registration">
                                <span>
                                    ${msg("noAccount")}
                                    <a tabindex="6"
                                        href="${url.registrationUrl}">
                                        ${msg("doRegister")}
                                    </a></span>
                            </div>
                        </div>
                    </#if>
                    </#if>
    </@layout.registrationLayout>
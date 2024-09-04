<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=true; section>
        <#if section="title">
            ${msg("acmeRegisterTrustedDeviceTitle")}
            <#elseif section="header">
                ${msg("acmeRegisterTrustedDeviceTitle")}
                <#elseif section="form">
                    <form action="${url.loginAction}" class="${properties.kcFormClass!}" id="kc-u2f-login-form" method="post">
                        <div class="login-card">
                            <div class="Logo"><img src="${url.resourcesPath}/img/BEWOTEC_Logo.png" alt="Logo" /></div>
                            <h2>
                                ${msg("acmeRegisterTrustedDeviceTitle")}
                            </h2>
                            <p>
                                ${msg("acmeRegisterTrustedDeviceCta")}
                            </p>
                            <div class="input-group">
                                <label for="device">
                                    ${msg("device")}
                                </label>
                                <input id="device" type="text" name="device" value="${(device!'')}" class="${properties.kcInputClass!}" />
                            </div>
                            <div class="actions">
                                <label>
                                    <input type="checkbox" id="removeOtherTrustedDevices" name="remove-other-trusted-devices"
                                        class="${properties.kcCheckboxInputClass!}" value="" />
                                    ${msg("removeAllTrustedDevices")}
                                </label>
                            </div>
                            <div class="button-group">
                                <#if isAppInitiatedAction??>
                                    <button class="primary-button" type="submit" name="trust-device">
                                        ${msg("yes")}
                                    </button>
                                    <button class="secondary-button" type="submit" name="dont-trust-device">
                                        ${msg("no")}
                                    </button>
                                    <button class="tertiary-button" type="submit" name="cancel-aia" value="true" formnovalidate>
                                        ${msg("doCancel")}
                                    </button>
                                    <#else>
                                        <button class="primary-button" type="submit" name="trust-device">
                                            ${msg("yes")}
                                        </button>
                                        <button class="secondary-button" type="submit" name="dont-trust-device">
                                            ${msg("no")}
                                        </button>
                                </#if>
                            </div>
                        </div>
                    </form>
        </#if>
    </@layout.registrationLayout>
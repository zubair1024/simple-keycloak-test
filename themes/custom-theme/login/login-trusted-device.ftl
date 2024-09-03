<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=true; section>
        <#if section="header">
            ${msg("trustedDevicesTitle")}
            <#elseif section="form">
                <div class="container">
                    <div class="login-container">
                        <div class="login-card">
                            <div class="Logo">
                                <img src="${url.resourcesPath}/img/BEWOTEC_Logo.png" alt="Logo" />
                            </div>
                            <h2>
                                ${msg("trustedDevicesTitle")}
                            </h2>
                            <div class="login-card-content">
                                ${msg("trustedDevicesIntro")}
                            </div>
                            <#if trustedDevices?? && trustedDevices?size gt 0>
                                <div class="device-list">
                                    <#list trustedDevices as device>
                                        <div class="device-item">
                                            <span class="device-name">
                                                ${device.name}
                                            </span>
                                            <span class="device-last-used">
                                                ${msg("lastUsed")}: ${device.lastUsed}
                                            </span>
                                            <form action="${url.loginAction}" method="post">
                                                <input type="hidden" name="deviceId" value="${device.id}">
                                                <button type="submit" name="action" value="revoke" class="revoke-button">
                                                    ${msg("revokeAccess")}
                                                </button>
                                            </form>
                                        </div>
                                    </#list>
                                </div>
                                <#else>
                                    <p class="no-devices">
                                        ${msg("noTrustedDevices")}
                                    </p>
                            </#if>
                            <div class="actions">
                                <a href="${url.loginUrl}" class="back-link">
                                    ${msg("backToLogin")}
                                </a>
                            </div>
                        </div>
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
                    ${msg("trustedDevicesExplanation")}
        </#if>
    </@layout.registrationLayout>
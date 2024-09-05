<#import "template.ftl" as layout>
    <@layout.registrationLayout; section>
        <#if section="header">
            <#elseif section="form">
                <div class="login-card">
                    <div class="Logo"><img src="${url.resourcesPath}/img/BEWOTEC_Logo.png" alt="BEWOTEC Logo" /></div>
                    <h2>
                        ${msg("pageExpiredTitle")}
                    </h2>
                    <p>
                        ${msg("pageExpiredMsg1")}
                    </p>
                    <div class="input-group">
                        <a id="loginRestartLink" href="${url.loginRestartFlowUrl}">
                            <button class="tertiary-button">
                                ${msg("restartLogin")}
                            </button>
                        </a>.
                    </div>
                    <a id="loginContinueLink" href="${url.loginAction}">
                        <button class="primary-button">
                            ${msg("continueLogin")}
                        </button>
                    </a>.
                </div>
                </div>
        </#if>
        </@layout.registrationLayout>
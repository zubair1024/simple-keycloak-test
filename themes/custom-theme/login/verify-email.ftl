<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
        <#if section="header">
            <h1>Hello world</h1>
            ${msg("emailVerifyTitle")}
            <#elseif section="form">
                <p class="instruction">
                    ${msg("emailVerifyInstruction1")}
                </p>
                <p class="instruction">
                    ${msg("emailVerifyInstruction2")}
                </p>
                <#if user.email??>
                    <p class="instruction">
                        ${msg("emailVerifyInstruction3")}
                        <b>
                            ${user.email}
                        </b>.
                    </p>
                </#if>
                <form id="kc-verify-email-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                            </div>
                        </div>
                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" />
                        </div>
                    </div>
                </form>
                <#elseif section="info">
                    <#if supportEmail??>
                        <p class="instruction">
                            ${msg("emailVerifyInstruction4")}
                            <a href="mailto:${supportEmail}">
                                ${supportEmail}
                            </a>
                        </p>
                    </#if>
        </#if>
    </@layout.registrationLayout>
<#import "template.ftl" as layout>
    <@layout.emailLayout>
        <h1>HEllo world</h1>
        ${kcSanitize(msg("emailVerificationBodyHtml",link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration)))?no_esc}
    </@layout.emailLayout>
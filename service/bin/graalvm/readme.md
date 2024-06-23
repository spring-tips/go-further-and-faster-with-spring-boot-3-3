# todo 

* modify the `pom.xml` and add the following to the `spring-boot-maven-plugin` configuration stanza.

```xml
<configuration>
    <image>
        <buildpacks>
            <buildpack>
                paketobuildpacks/java:beta
            </buildpack>
            <builder>paketobuildpacks/builder-jammy-buildpacks-tiny</builder>
        </buildpacks>
    </image>
</configuration>
```
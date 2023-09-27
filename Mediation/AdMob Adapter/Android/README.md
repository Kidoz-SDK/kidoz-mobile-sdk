# Kidoz Admob Android Adapter
The kidoz Google Admob was built and tested with play-services-ad v22.1.0.<BR>
Check out the [Max Mediation Documentation](https://dash.applovin.com/documentation/mediation/android/getting-started/integration) for app level integration.

### Integration Steps:

Include the following inside your app build.gradle dependencies:

```java
dependencies {
    implementation 'org.greenrobot:eventbus:3.3.1'
    implementation 'net.kidoz.sdk:kidoz-android-native:9.0.0'
    implementation "net.kidoz.sdk:kidoz-android-admob-adapter:1.9.0"
}
```

**Kidoz Adapter**
* Set the following full path in the `Class Name` field: </br>
`com.kidoz.mediation.admob.adapters.KidozAdMobAdapter`
* Set the following json string in the `Parameter (optional)` field: </br>
`{"AppID":"publisherId", "Token":"publisherToken"}` <B>*</B>

<B>*</B> Replace `publisherId` and `publisherToken` with the credentials received during the Kidoz Publisher Account sign up.

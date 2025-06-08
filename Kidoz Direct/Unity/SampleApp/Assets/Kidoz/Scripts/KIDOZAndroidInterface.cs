using System;
using KIDOZNativeInterface;
using System.Runtime.InteropServices;
using System.Collections;
using UnityEngine; 
using UnityEngine.UI;

namespace KIDOZAndroidInterface {
#if UNITY_ANDROID
	public class KIDOZAndroidInterface : KIDOZNativeInterface.KIDOZNativeInterface
	{

		private static AndroidJavaObject kidozBridgeObject = null;
		private AndroidJavaObject activityContext = null;
		
		public KIDOZAndroidInterface()
		{
		}

		public void init(string developerID, string securityToken,string pluginVersion)
		{
			
			///get activity
			using (AndroidJavaClass activityClass = new AndroidJavaClass ("com.unity3d.player.UnityPlayer")) {
				activityContext = activityClass.GetStatic<AndroidJavaObject> ("currentActivity");
			}

			string kidoz_name = KidozSDK.Kidoz.Instance.gameObject.name;

			//init Kidoz
			using (var kidozBridgeClass = new AndroidJavaClass ("net.kidoz.platforms.KidozUnityBridge")) {

				kidozBridgeObject = kidozBridgeClass.CallStatic<AndroidJavaObject> ("getInstance", activityContext);

				kidozBridgeObject.Call ("initialize", new object [] { activityContext, developerID, securityToken,pluginVersion ,kidoz_name});				

			}

		}

		public bool isInitialised(){
			if (kidozBridgeObject == null) {
				return false;
			}

			return kidozBridgeObject.Call<bool>("isInitialised");
		}

		public string getSdkVersion(){
			if (kidozBridgeObject == null) {
				return "----";
			}

			return kidozBridgeObject.Call<string>("getSDKVersion");
		}


		
		//***********************************//
		//***** INTERSTITIAL & REWARDED *****//
		//***********************************//

		public void loadInterstitialAd()
		{
			kidozBridgeObject.Call("loadInterstitialAd");
		}

		public void showInterstitial()
		{
			kidozBridgeObject.Call("showInterstitial");
		}
		
		public bool getIsInterstitialLoaded()
		{
			return kidozBridgeObject.Call<bool>("getIsInterstitialLoaded");
		}

		public void loadRewardedAd()
		{
			kidozBridgeObject.Call("loadRewardedAd");
		}
		
		public void showRewarded()
		{
			kidozBridgeObject.Call("showRewarded");
		}
		
		public bool getIsRewardedLoaded()
		{
			return kidozBridgeObject.Call<bool>("getIsRewardedLoaded");
		}


		//******************//
		//***** BANNER *****//
		//******************//

		public void loadBanner(bool autoShow, int position)
		{
			kidozBridgeObject.Call("loadBannerAd", autoShow, position);
		}

		public void setBannerPosition(int position)
		{
			kidozBridgeObject.Call("setBannerPosition", position);
		}

		public void showBanner()
		{
			kidozBridgeObject.Call ("showBannerAd");
		}

		public void hideBanner()
		{
			kidozBridgeObject.Call ("hideBannerAd");
		}

		public void logMessage(string message)
		{
			kidozBridgeObject.Call("printToastLog",message); 
		}
	}
#endif
}

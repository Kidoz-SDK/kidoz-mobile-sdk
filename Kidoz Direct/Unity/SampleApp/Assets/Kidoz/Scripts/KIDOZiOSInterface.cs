using System;
using AOT;
using KIDOZNativeInterface;
using System.Runtime.InteropServices;

namespace KIDOZiOSInterface {
#if UNITY_IOS
	public class KIDOZiOSInterface : KIDOZNativeInterface.KIDOZNativeInterface
	{

		enum KidozSDKEvents {
			SDK_INIT_SUCCESS,
			SDK_INIT_ERROR,

			KIDOZ_INTERSTITIAL_LOADED,
			KIDOZ_INTERSTITIAL_FAILED_TO_LOAD,
			KIDOZ_INTERSTITIAL_SHOWN,
			KIDOZ_INTERSTITIAL_FAILED_TO_SHOW,
			KIDOZ_INTERSTITIAL_IMPRESSION,
			KIDOZ_INTERSTITIAL_CLOSED,
    
			KIDOZ_REWARDED_LOADED,
			KIDOZ_REWARDED_FAILED_TO_LOAD,
			KIDOZ_REWARDED_SHOWN,
			KIDOZ_REWARDED_FAILED_TO_SHOW,
			KIDOZ_REWARDED_IMPRESSION,
			KIDOZ_REWARDED_RECEIVED,
			KIDOZ_REWARDED_CLOSED,
    
			KIDOZ_BANNER_LOADED,
			KIDOZ_BANNER_FAILED_TO_LOAD,
			KIDOZ_BANNER_SHOWN,
			KIDOZ_BANNER_FAILED_TO_SHOW,
			KIDOZ_BANNER_IMPRESSION,
			KIDOZ_BANNER_CLOSED
		};
		
		[DllImport("__Internal")]
		private static extern void KidozInit(string developerID ,string securityToken ,DelegateMessage callback,string pluginVersion);
		
		[DllImport("__Internal")]
		private static extern bool KidozIsInitialised();
		
		[DllImport("__Internal")]
		private static extern void KidozLogMessage(string message);
		
		[DllImport("__Internal")]
		private static extern void KidozLoadInterstitialAd(bool autoShow);
		
		[DllImport("__Internal")]
		private static extern void KidozShowInterstitial();
		
		[DllImport("__Internal")]
		private static extern bool KidozGetIsInterstitialLoaded();
		
		[DllImport("__Internal")]
		private static extern void KidozLoadRewardedAd(bool autoShow);
		
		[DllImport("__Internal")]
		private static extern void KidozShowRewarded();
		
		[DllImport("__Internal")]
		private static extern bool KidozGetRewardedLoaded();
		
		[DllImport("__Internal")]
		private static extern void KidozLoadBannerAd(bool autoShow,int position);
		
		[DllImport("__Internal")]
		private static extern void KidozSetBannerPosition(int position);
		
		[DllImport("__Internal")]
		private static extern void KidozShowBanner();
		
		[DllImport("__Internal")]
		private static extern void KidozHideBanner();		
		
		private delegate void DelegateMessage(int number,string message);
		
		[MonoPInvokeCallback(typeof(DelegateMessage))] 
		private static void delegateMessageReceived(int number,string message) {
			
			switch((KidozSDKEvents)number){
				
			case KidozSDKEvents.SDK_INIT_SUCCESS:
				KidozSDK.Kidoz.Instance.initSuccessCallback("");
				break;
				
			case KidozSDKEvents.SDK_INIT_ERROR:
				KidozSDK.Kidoz.Instance.initErrorCallback(message);
				break;

						
			case KidozSDKEvents.KIDOZ_INTERSTITIAL_LOADED:
				KidozSDK.Kidoz.Instance.interstitialLoadedCallBack("");
				break;
			case KidozSDKEvents.KIDOZ_INTERSTITIAL_FAILED_TO_LOAD:
				KidozSDK.Kidoz.Instance.interstitialFailedToLoadCallBack(message);
				break;	
			case KidozSDKEvents.KIDOZ_INTERSTITIAL_SHOWN:
				KidozSDK.Kidoz.Instance.interstitialShownCallBack("");
				break;
			case KidozSDKEvents.KIDOZ_INTERSTITIAL_FAILED_TO_SHOW:
				KidozSDK.Kidoz.Instance.interstitialFailedToShowCallBack(message);
				break;
			case KidozSDKEvents.KIDOZ_INTERSTITIAL_IMPRESSION:
				KidozSDK.Kidoz.Instance.interstitialImpressionCallBack("");
				break;
			case KidozSDKEvents.KIDOZ_INTERSTITIAL_CLOSED:
				KidozSDK.Kidoz.Instance.interstitialClosedCallBack("");
				break;				

				
			case KidozSDKEvents.KIDOZ_REWARDED_LOADED:
				KidozSDK.Kidoz.Instance.rewardedLoadedCallBack("");
				break;
			case KidozSDKEvents.KIDOZ_REWARDED_FAILED_TO_LOAD:
				KidozSDK.Kidoz.Instance.rewardedFailedToLoadCallBack(message);
				break;	
			case KidozSDKEvents.KIDOZ_REWARDED_SHOWN:
				KidozSDK.Kidoz.Instance.rewardedShownCallBack("");
				break;
			case KidozSDKEvents.KIDOZ_REWARDED_FAILED_TO_SHOW:
				KidozSDK.Kidoz.Instance.rewardedFailedToShowCallBack(message);
				break;
			case KidozSDKEvents.KIDOZ_REWARDED_IMPRESSION:
				KidozSDK.Kidoz.Instance.rewardedImpressionCallBack("");
				break;
			case KidozSDKEvents.KIDOZ_REWARDED_RECEIVED:
				KidozSDK.Kidoz.Instance.rewardedReceivedCallBack("");
				break;
			case KidozSDKEvents.KIDOZ_REWARDED_CLOSED:
				KidozSDK.Kidoz.Instance.rewardedClosedCallBack("");
				break;

			case KidozSDKEvents.KIDOZ_BANNER_LOADED:
				KidozSDK.Kidoz.Instance.bannerLoadedCallBack("");
				break;
			case KidozSDKEvents.KIDOZ_BANNER_FAILED_TO_LOAD:
				KidozSDK.Kidoz.Instance.bannerFailedToLoadCallBack(message);
				break;	
			case KidozSDKEvents.KIDOZ_BANNER_SHOWN:
				KidozSDK.Kidoz.Instance.bannerShownCallBack("");
				break;
			case KidozSDKEvents.KIDOZ_BANNER_FAILED_TO_SHOW:
				KidozSDK.Kidoz.Instance.bannerFailedToShowCallBack(message);
				break;
			case KidozSDKEvents.KIDOZ_BANNER_IMPRESSION:
				KidozSDK.Kidoz.Instance.bannerImpressionCallBack("");
				break;
			case KidozSDKEvents.KIDOZ_BANNER_CLOSED:
				KidozSDK.Kidoz.Instance.bannerClosedCallBack("");
				break;				


				
			}
			
		}
		
		
		public KIDOZiOSInterface()
		{
			
		}
		
		public bool isInitialised()
		{
			return KidozIsInitialised();
		}
		
		public void init(string developerID, string securityToken,string pluginVersion)
		{			
			KidozInit(developerID,securityToken,delegateMessageReceived,pluginVersion);			
		}
		
		//***********************************//
		//***** INTERSTITIAL & REWARDED *****//
		//***********************************//
		
		
		public void generateInterstitial()
		{
			KidozLoadInterstitialAd(false);
		}
		
		public void loadInterstitialAd(bool autoShow)
		{
			KidozLoadInterstitialAd(autoShow);
		}
		
		
		public void showInterstitial()
		{
			KidozShowInterstitial();
		}
		
		public bool getIsInterstitialLoaded()
		{
			return  KidozGetIsInterstitialLoaded();
		}
		
		public void generateRewarded()
		{
			KidozLoadRewardedAd (false);
		}
		
		public void loadRewardedAd(bool autoShow)
		{
			KidozLoadRewardedAd(autoShow);
		}
		
		
		public void showRewarded()
		{
			KidozShowRewarded();
		}
		
		public bool getIsRewardedLoaded()
		{
			return KidozGetRewardedLoaded();
		}
		
		//***********************************//
		
		//************ BANNER ***************//
		
		public void setBannerPosition (int position)
		{	
			KidozSetBannerPosition(position);
		}
		
		public void loadBanner(bool autoShow, int position)
		{	
			KidozLoadBannerAd(autoShow,position);
			
		}
		
		public void showBanner()
		{
			KidozShowBanner();
		}
		
		public void hideBanner()
		{
			KidozHideBanner();
		}
		
		//***********************************//
		
		public void logMessage(string message)
		{
			KidozLogMessage (message);
		}

		
	    public void setupCallbacks ()
		{
		}
		
	}
	
#endif
}
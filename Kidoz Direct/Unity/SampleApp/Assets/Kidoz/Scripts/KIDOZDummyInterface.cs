using UnityEngine;
using System.Collections;
using System;
using KIDOZNativeInterface;

namespace KIDOZDummyInterface
{
	public class KIDOZDummyInterface :KIDOZNativeInterface.KIDOZNativeInterface
	{

		public bool getIsInterstitialLoaded ()
		{
			return false;
		}


		public bool getIsRewardedLoaded ()
		{
			return false;
		}

		public void hideBanner ()
		{
			DebugLog ( "hideBanner" );
		}


		public void init (string developerID, string securityToken,string pluginVersion)
		{
			DebugLog ( "init, developerID=" + developerID + ", securityToken=" + securityToken );
		}

		public bool isInitialised ()
		{
			return true;
		}

		public void loadBanner (bool autoShow, int position)
		{
			DebugLog ( "loadBanner, autoShow=" + autoShow + ", position=" + position );
		}

		public void loadInterstitialAd ()
		{
			DebugLog ( "loadInterstitialAd" );
		}

		public void loadRewardedAd ()
		{
			DebugLog ( "loadRewardedAd" );
		}

		public void logMessage (string message)
		{
			DebugLog ( message );
		}

		public void setBannerPosition (int position)
		{
			DebugLog ( "setBannerPosition, position=" + position );
		}

		public void showBanner ()
		{
			DebugLog ( "showBanner" );
		}

		public void showInterstitial ()
		{
			DebugLog ( "showInterstitial" );
		}

		public void showRewarded ()
		{
			DebugLog ( "showRewarded" );
		}


		private void DebugLog (string msg)
		{
			Debug.Log ( "KIDOZ Dummy: " + msg );
		}

	}
}

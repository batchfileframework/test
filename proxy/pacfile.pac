/*
// -- UTC Aero ZCC Forwarding Profile --
// -- Last Update 19 SEP 2023
//
// For Information on Requesting Pac Changes Contact:
// Pratt & Whitney - PW DT Cyber Intel/Threat Ops
// Pratt & Whitney Canada - Patrick Boivin
// Collins (hUTAS) - Collins Cybersecurity COE
// RTX Corporate - Jonathan Stephens
// RTX Research Center - Joe Mrozek
//
*/

var SRCIP = "141.119.184.30";
var PUBLIC;
var UTCVZEN;
var VZEN;
var ONTRUST = 1;
var ONVPN = 0;
var BYPASS = "DIRECT";
var myip = myIpAddress();
var lastdigit = myip.substring((myip.length)-1)%2;
if (isNaN(lastdigit)) {lastdigit=0;}
// Most special use IPv4 addresses (RFC 5735) defined within this regex.
var privateIP = /^(0|10|127|192\.168|172\.1[6789]|172\.2[0-9]|172\.3[01]|169\.254|192\.88\.99)\.[0-9.]+$/;

/* Check if user is on-trust or connected to VPN - localization */

// Newington and Meriden

if (
    (SRCIP=="192.249.49.31") ||
    (SRCIP=="52.225.221.126") ||
    (SRCIP=="52.232.176.150") ||
    (SRCIP=="192.249.49.38") ||
    (SRCIP=="192.249.50.66") ||
    (SRCIP=="192.249.50.72") ||
    (SRCIP=="23.97.4.71") ||
    (SRCIP=="52.238.163.114") ||
    (SRCIP=="52.245.240.49") ||
    (SRCIP=="52.126.183.43") ||
    (SRCIP=="52.177.234.62") ||
    (SRCIP=="52.138.122.126")
    )
 {
 ONTRUST = 1;
 }
// RTX Perf Hub Chicago
else if (
    (isInNet(SRCIP, "128.13.120.224", "255.255.255.248"))
    )
    {
        ONTRUST = 1;
    }

// RTX Perf Hub Ashburn
else if (
    (isInNet(SRCIP, "128.13.125.224", "255.255.255.248"))
    )
    {
        ONTRUST = 1;
    }

// Other RTX Perf Hubs
else if (
    (isInNet(SRCIP, "128.13.121.224", "255.255.255.248")) ||
    (isInNet(SRCIP, "128.13.122.224", "255.255.255.248")) ||
    (isInNet(SRCIP, "128.13.123.224", "255.255.255.248")) ||
    (isInNet(SRCIP, "128.13.124.224", "255.255.255.248")) ||
    (isInNet(SRCIP, "128.13.126.224", "255.255.255.248"))
)
{
    ONTRUST = 1;
}
    // Roissy and Maidstone
      else if (
  (SRCIP=="192.249.36.3") ||
  (SRCIP=="192.249.36.13") ||
  (SRCIP=="192.249.39.3") ||
  (SRCIP=="192.249.39.13")
  )
  {
ONTRUST = 1;
  }

// PWC Longueil
else if ((SRCIP=="141.119.184.130") || (SRCIP=="141.119.184.10") || (SRCIP=="141.119.184.30") || (SRCIP=="40.85.246.17"))
 {
    ONTRUST = 1;
 }

// Singapore
else if ((SRCIP=="192.249.41.2") || (SRCIP=="199.191.43.14"))
{
ONTRUST = 1;
}

// Public ZENs for Road Warriors

else
 {
 ONTRUST = 0;
 }

//find if you are on VPN
if ( //check for Newington & Meriden 
    /* Newington VPN */
       isInNet(myip, "10.192.112.0", "255.255.240.0") || 
       isInNet(myip, "10.192.208.0", "255.255.240.0") ||
       isInNet(myip, "10.192.96.0", "255.255.240.0")  ||
       isInNet(myip, "10.192.232.0", "255.255.255.128")  ||
       isInNet(myip, "10.192.232.128", "255.255.255.128")  ||
       isInNet(myip, "10.192.233.0", "255.255.255.128")  ||
       isInNet(myip, "10.194.128.0", "255.255.224.0") ||
       isInNet(myip, "10.9.48.0", "255.255.240.0") ||
    /* Aero Newington */
        isInNet(myip, "10.161.64.0", "255.255.248.0")  ||
        isInNet(myip, "10.161.88.0", "255.255.255.128")  ||
        isInNet(myip, "10.161.72.0", "255.255.248.0")  ||
        isInNet(myip, "10.161.88.128", "255.255.255.128")  ||
        isInNet(myip, "10.162.128.0", "255.255.224.0") ||
        isInNet(myip, "10.162.160.0", "255.255.224.0") ||
    /* PWA VPN */
        isInNet(myip, "172.18.76.128", "255.255.255.128")  ||
        isInNet(myip, "172.18.48.0", "255.255.255.128")   
    ) {
    ONVPN = ONTRUST = 1;
    }
/* PH VPN - Chicago */
else if ( 
    isInNet(myip, "10.202.0.0", "255.255.0.0"))
    {
        ONVPN = ONTRUST = 1;    
    }
/* PH VPN - Ashburn */
else if ( 
    isInNet(myip, "10.207.0.0", "255.255.0.0") ||
    /* Meriden VPN */
    isInNet(myip, "10.193.112.0", "255.255.240.0")  ||
    isInNet(myip, "10.193.208.0", "255.255.240.0")  ||
    isInNet(myip, "10.193.96.0", "255.255.240.0")  ||
    isInNet(myip, "10.193.232.0", "255.255.255.128")  ||
    isInNet(myip, "10.193.232.128", "255.255.255.128")  ||
    isInNet(myip, "10.193.233.0", "255.255.255.128")  ||
    isInNet(myip, "10.9.192.0", "255.255.224.0") ||
    isInNet(myip, "10.9.224.0", "255.255.224.0") ||
    /* Aero Meriden */
    isInNet(myip, "10.161.192.0", "255.255.248.0")  ||
    isInNet(myip, "10.161.216.0", "255.255.255.128")  ||
    isInNet(myip, "10.161.200.0", "255.255.248.0")  ||
    isInNet(myip, "10.161.216.128", "255.255.255.128") ||
    isInNet(myip, "10.162.192.0", "255.255.224.0") ||
    isInNet(myip, "10.162.224.0", "255.255.224.0"))
    {
        ONVPN = ONTRUST = 1;    
    }

/* Other PH VPN */
else if ( 
    isInNet(myip, "10.203.0.0", "255.255.0.0")  || //Dallas
    isInNet(myip, "10.204.0.0", "255.255.0.0")  || //Miami
    isInNet(myip, "10.205.0.0", "255.255.0.0")  || //Seattle
    isInNet(myip, "10.206.0.0", "255.255.0.0"))   //Los Angeles
{
    ONVPN = ONTRUST = 1;    
}
/* PWC Longeueil and St. Hubert */
else if ( 
    /* PWC VPN */
    isInNet(myip, "10.16.192.0", "255.255.240.0")  ||
    isInNet(myip, "10.16.208.0", "255.255.240.0"))
    {
        ONVPN = ONTRUST = 1;  
    } 
  // Maidstone   
else if (
    /* Maidstone VPN */
    isInNet(myip, "10.200.4.0", "255.255.252.0") ||
    isInNet(myip, "172.30.224.0", "255.255.255.0")  ||
    isInNet(myip, "172.30.225.0", "255.255.255.128")  ||
    /* Aero Maidstone */
    isInNet(myip, "10.162.0.0", "255.255.248.0")  ||
    isInNet(myip, "10.162.27.0", "255.255.255.128")  ||
    isInNet(myip, "10.162.8.0", "255.255.248.0")  ||
    isInNet(myip, "10.162.127.128", "255.255.255.128") 
    ) {
        ONVPN = ONTRUST = 1;
     }
// Singapore
else if ( 
    /* Singapore VPN */
    isInNet(myip, "10.224.22.0", "255.255.254.0")  ||
    isInNet(myip, "10.224.48.0", "255.255.240.0")  ||
    isInNet(myip, "172.28.8.0", "255.255.255.0")  ||
    isInNet(myip, "172.28.12.0", "255.255.255.128")	||
    /* Aero Singapore */
    isInNet(myip, "10.163.0.0", "255.255.248.0")  ||
    isInNet(myip, "10.163.27.0", "255.255.255.128")  ||
    isInNet(myip, "10.163.8.0", "255.255.248.0")  ||
    isInNet(myip, "10.163.127.128", "255.255.255.128")
) {
    ONVPN = ONTRUST = 1;
}
 
function FindProxyForURL(url, host) {

// Send everything other than HTTP, WSS and HTTPS direct
// Uncomment middle line if FTP over HTTP is enabled         
          if ((url.substring(0,5) != "http:") &&
                  (url.substring(0,4) != "wss:") &&
//                (url.substring(0,4) != "ftp:") &&
                  (url.substring(0,6) != "https:"))
                  return BYPASS;

 //      Go direct for queries about Zscaler infrastructure status

    var trust = /^(trust|ips).(zscaler|zscalerone|zscalertwo|zscalerthree|zscloud).(com|net)$/;
    if (trust.test(host))
    return BYPASS;
    /* Bypasses for ZAPP/ZPA */
	if (
        shExpMatch(host, "api.zscalerconnect.net") ||
        shExpMatch(host, "api.zscalershift.net") ||
        shExpMatch(host, "broker.prod.zshift.net") ||
        shExpMatch(host, "jquery.com") ||
        shExpMatch(host, "gstatic.com") ||
        shExpMatch(host, "mobile.zscalertwo.net")
        ) return BYPASS;

    /* Send Zoom, Webex, YouTube Video, and MSFT Updates direct when on VPN */
    if ( (ONVPN == 1) && (
        shExpMatch(host, "zoom.com") ||
        shExpMatch(host, "*.zoom.com") ||
        shExpMatch(host, "zoom.us")  ||
        shExpMatch(host, "*.zoom.us")  ||
        shExpMatch(host, "zoomgov.com") ||
        shExpMatch(host, "*.zoomgov.com") ||
        shExpMatch(host, "webex.com") ||
        shExpMatch(host, "*.webex.com") ||
        shExpMatch(host, "*.googlevideo.com") ||
        shExpMatch(host, "rtxcmg.rtx.com") ||
        shExpMatch(host, "gwtocm.rtx.com") ||
        shExpMatch(host, "rtxcmg.cloudapp.net") ||
        shExpMatch(host, "rtxcmg.blob.core.windows.net") ||
        shExpMatch(host, "d37vpciad837gw.cloudfront.net") ||
        shExpMatch(host, "outlook.office365.us") ||
        dnsDomainIs(host, "gov.teams.microsoft.us") ||
        shExpMatch(host, "*.infra.gov.skypeforbusiness.us") ||
        shExpMatch(host, "*.online.gov.skypeforbusiness.us") ||
        shExpMatch(host, "download.windowsupdate.com") ||
        shExpMatch(host, "*.download.windowsupdate.com") ||
        shExpMatch(host, "dl.delivery.mp.microsoft.com") ||
        shExpMatch(host, "officecdn.microsoft.com") ||
        shExpMatch(host, "officecdn.microsoft.com.edgesuite.net") ||
        shExpMatch(host, "*.kaltura.com") ||
        shExpMatch(host, "video.rtx.com") ||
        shExpMatch(host, "kalsegsec-a.akamaihd.net") ||
        shExpMatch(host, "kalseglive-a.akamaihd.net") ||
        shExpMatch(host, "klive-a.akamaihd.net") ||
        shExpMatch(host, "kms-a.akamaihd.net"))
        )
        return BYPASS;

            /* External Sites Needing Explicit Directive To Avoid DNS Look Up Below To Resolve App Specific Problems - Send PROXY */
	if (
        shExpMatch(host, "*.force.com") ||
        dnsDomainIs(host, "cgs.webex.com") ||
        shExpMatch(host, "*.salesforce.com") ||
        shExpMatch(host, "force.com") ||
        shExpMatch(host, "salesforce.com") ||
        shExpMatch(host, "servicebench.com") ||
        shExpMatch(host, "*.mykds.com") ||
        shExpMatch(host, "nebular.webex.com") ||
        shExpMatch(host, "tsa.webex.com") ||
        shExpMatch(host, "sms.peninsular-india.com") ||
        shExpMatch(host, "go.firesecurityproducts.com") ||
        dnsDomainIs(host, "status.webex.com") ||
        dnsDomainIs(host, "help.webex.com") ||
        dnsDomainIs(host, "service-status.webex.com") ||
        dnsDomainIs(host, "blog.webex.com") ||
        shExpMatch(host, "*.raytheonintelligenceandspace.com") ||
        shExpMatch(host, "*.raytheonmissilesanddefense.com")
        ) return "PROXY 127.0.0.1:9000"; 
        
/* Pac File Specific Web Site Directives - Send DIRECT */
if (
    dnsDomainIs(host, "pac.zscalertwo.net") ||
    shExpMatch(host, "*.adphc.com") ||
    shExpMatch(host, "*.aero.bombardier.net") ||
    shExpMatch(host, "*.boeingteam.net") ||
    shExpMatch(host, "*.eos.goodrich.com") ||
    shExpMatch(host, "*.f7x.com") ||
    shExpMatch(host, "*.grpportal.local") ||
    shExpMatch(host, "*.root.local") ||
    shExpMatch(host, "*.vvt.goodrich.com") ||
    shExpMatch(host, "*bdirect.aero.bombardier.com") ||
    shExpMatch(host, "*sap.goodrich") ||
    shExpMatch(host, "aerostructures.goodrich.com") ||
    shExpMatch(host, "aerovantix.goodrich.com") ||
    shExpMatch(host, "ahcmt03.goodrich.com") ||
    shExpMatch(host, "asg.goodrich.com") ||
    shExpMatch(host, "avx.goodrich.com") ||
    shExpMatch(host, "awb.goodrich.com") ||
    shExpMatch(host, "bps.com") ||
    shExpMatch(host, "bps.goodrich.com") ||
    shExpMatch(host, "clt02iis012.goodrich.com") ||
    shExpMatch(host, "compatibilite.dosatron.com") ||
    shExpMatch(host, "corp.goodrich.com") ||
    shExpMatch(host, "darzeport.dassault-avion.ext") ||
    shExpMatch(host, "dev.goodrich.com") ||
    shExpMatch(host, "doctec.com") ||
    shExpMatch(host, "eos.goodrich.com") ||
    shExpMatch(host, "gdcd3.aeb.de") ||
    shExpMatch(host, "hosting.corena.com") ||
    shExpMatch(host, "hrconnect.goodrich.com") ||
    shExpMatch(host, "int-stage.goodrich.com") ||
    shExpMatch(host, "int.goodrich.com") ||
    shExpMatch(host, "itss.goodrich.com") ||
    shExpMatch(host, "km.goodrich.com") ||
    shExpMatch(host, "lms.goodrich.com") ||
    shExpMatch(host, "lmsrm.goodrich.com") ||
    shExpMatch(host, "mail.goodrich.com") ||
    shExpMatch(host, "new.goodrich.com") ||
    shExpMatch(host, "nhc0sx02.goodrich.com") ||
    shExpMatch(host, "nhc0sx03.goodrich.com") ||
    shExpMatch(host, "nhc0sx08.goodrich.com") ||
    shExpMatch(host, "owa.west.goodrich.com") ||
    shExpMatch(host, "sap.goodrich.com") ||
    shExpMatch(host, "ssc.goodrich.com") ||
    shExpMatch(host, "ssd.goodrich.com") ||
    shExpMatch(host, "stage.goodrich.com") ||
    shExpMatch(host, "suppliers.utc.com") ||
    shExpMatch(host, "tar*.dosatron.com") ||
    shExpMatch(host, "srm.goodrich.com") ||
    shExpMatch(host, "ukotis.api.crm4.dynamics.com") ||
    shExpMatch(host, "ukotis.crm4.dynamics.com") ||
    shExpMatch(host, "ukfieldoneuat.api.crm4.dynamics.com") ||
    shExpMatch(host, "ukfieldoneuat.crm4.dynamics.com") ||
    shExpMatch(host, "disco.api.crm4.dynamics.com") ||
    shExpMatch(host, "disco.crm4.dynamics.com") ||
    shExpMatch(host, "glukcrmstg.api.crm4.dynamics.com") ||
    shExpMatch(host, "glukcrmstg.crm4.dynamics.com") ||
    shExpMatch(host, "ukfieldcc.api.crm4.dynamics.com") ||
    shExpMatch(host, "ukfieldcc.crm4.dynamics.com") ||
    shExpMatch(host, "wins.goodrich.com") ||
    shExpMatch(host, "pwww.eh.pweh.com") ||
    shExpMatch(host, "ctx.dc.aeb.com") ||
    shExpMatch(host, "194.175.186.16") ||
    dnsDomainIs(host, "utc.lvcloud.com") ||
    dnsDomainIs(host, "utcdev.lvcloud.com") ||
    dnsDomainIs(host, "utcqa.lvcloud.com") ||
    dnsDomainIs(host, "rtx.lvcloud.com") ||
    dnsDomainIs(host, "rtxdev.lvcloud.com") ||
    shExpMatch(host, "kltuats.kpmgspectrum.com") ||
    shExpMatch(host, "kpmgleasingtool.kpmg.com") ||
    shExpMatch(host, "ngpf.cscanada.ca") ||
    shExpMatch(host, "dime.sia.com.sg") ||
    shExpMatch(host, "rccitrix.rockwellcollins.com") ||
    shExpMatch(host, "crntddc01.rockwellcollins.com") ||
    shExpMatch(host, "crntddc02.rockwellcollins.com") ||
    shExpMatch(host, "crntddc05.rockwellcollins.com") ||
    shExpMatch(host, "crntddc06.rockwellcollins.com") ||
    shExpMatch(host, "crntxapvs043.rockwellcollins.com") ||
    shExpMatch(host, "crntxapvs044.rockwellcollins.com") ||
    shExpMatch(host, "citrixweb.arinc.com") ||
    shExpMatch(host, "131.198.26.11")||
    shExpMatch(host, "131.198.26.40")||
    shExpMatch(host, "131.198.26.14")||
    shExpMatch(host, "131.198.26.24")||
    shExpMatch(host, "131.198.26.25")||
    shExpMatch(host, "131.198.209.234")||
    shExpMatch(host, "131.198.209.31") ||
    shExpMatch(host, "*.kontiki.com") ||
    shExpMatch(host, "usplsawm01.ssn.entsvcs.com") ||
    shExpMatch(host, "ciusrsbx.rockwellcollins.com")
    ) return BYPASS;

/*-----------------------------------------------------------------*/

/* Special case for extranet-v10.utc.com - Aventail users to use */
if (shExpMatch(host, "159.82.150.15")) return BYPASS;

/* Special case for Bombardier */
if (dnsDomainIs(host, ".aero.bombardier.net") || isInNet(host, "127.0.10.203", "255.255.255.255") || dnsDomainIs(host, "localhost")) return BYPASS;

/* "PROXY DIRECT" List */
if (
 shExpMatch(host, "serveur-portillon.pwc.ca") ||
 isInNet (host, "141.119.14.200", "255.255.255.255")

) return BYPASS;

/* Unqualified Host Name - Send DIRECT */
if (
    (isPlainHostName(host))
    ) return BYPASS;

/* Internal Sites And Those Available Directly Due To FSRs - Send DIRECT */
if (
    shExpMatch(host, "*.aero.bombardier.net") ||
    shExpMatch(host, "*.airbus.corp") ||
    shExpMatch(host, "*.goodrich.root.local") ||
    shExpMatch(host, "*.ies.uk.com") ||
    shExpMatch(host, "*.kollective.com") ||
    shExpMatch(host, "*.kollective.app") ||
    shExpMatch(host, "*.jsfvpc.lmtas.com") ||
    shExpMatch(host, "*.kontiki.com") ||
    shExpMatch(host, "*.namequery.com") ||
    shExpMatch(host, "*.ngcc.bt.com") ||
    shExpMatch(host, "*.pzlnet") ||
    shExpMatch(host, "*.sap.goodrich.com") ||
    shExpMatch(host, "*.smc-net.co.uk") ||
    shExpMatch(host, "*.utcain.com") ||
    shExpMatch(host, "dev-home.rtx.com") ||
    shExpMatch(host, "qa-home.rtx.com") ||
    shExpMatch(host, "stg-home.rtx.com") ||
    shExpMatch(host, "home.rtx.com") ||
    shExpMatch(host, "*.utcaus.com") ||
    shExpMatch(host, "*.utccgl.com") ||
    shExpMatch(host, "*.utcfs.uk.com") ||
    shExpMatch(host, "*jpajde*") ||
    shExpMatch(host, "137.32.176.101") ||
    shExpMatch(host, "137.32.203.199") ||
    shExpMatch(host, "159.82.228.111") ||
    shExpMatch(host, "159.82.228.25") ||
    shExpMatch(host, "159.82.228.26") ||
    shExpMatch(host, "159.82.84.231") ||
    shExpMatch(host, "159.82.84.232") ||
    shExpMatch(host, "159.82.84.233") ||
    shExpMatch(host, "195.220.12.253") ||
    shExpMatch(host, "195.220.14.11") ||
    shExpMatch(host, "195.220.8.33") ||
    shExpMatch(host, "205.174.22.60") ||
    shExpMatch(host, "205.174.22.61") ||
    shExpMatch(host, "217.112.124.203") ||
    shExpMatch(host, "53.131.70.172") ||
    shExpMatch(host, "64.124.19.178") ||
    shExpMatch(host, "64.124.19.179") ||
    shExpMatch(host, "carsupa2-07.chntva1-dc1.genuity.net") ||
    shExpMatch(host, "cerbere-na.airbus.com") ||
    shExpMatch(host, "ws.fedex.com") ||
    shExpMatch(host, "cerbere.airbus.com") ||
    shExpMatch(host, "csg.delta.com") ||
    shExpMatch(host, "csreports.sensitechccv.com") ||
    shExpMatch(host, "csweb.sensitechccv.com") ||
    shExpMatch(host, "cussyw0g") ||
    shExpMatch(host, "digitalfuelutc.acsfna.com") ||
    shExpMatch(host, "files.tracell.com") ||
    shExpMatch(host, "fsi-corp.com") ||
    shExpMatch(host, "future.tracell.com") ||
    shExpMatch(host, "fwdata.tracell.com") ||
    shExpMatch(host, "gate-fr.airbus.com") ||
    shExpMatch(host, "gate-na.airbus.com") ||
    shExpMatch(host, "intranet.wskrz.com") ||
    shExpMatch(host, "lb.ares.prod.purple.us") ||
    shExpMatch(host, "nfuse.delta.com") ||
    shExpMatch(host, "norev02.noresco.com") ||
    shExpMatch(host, "norevsite01.noresco.com") ||
    shExpMatch(host, "norexchange1.noresco.com") ||
    shExpMatch(host, "norexfront.noresco.com") ||
    shExpMatch(host, "norgood.noresco.com") ||
    shExpMatch(host, "norvault1.noresco.com") ||
    shExpMatch(host, "p3.sip.prod.purple.us") ||
    shExpMatch(host, "portail.cg35.fr") ||
    shExpMatch(host, "portal.sensitechccv.com") ||
    shExpMatch(host, "provsvndata-sensitech.freightwatchintl.com") ||
    shExpMatch(host, "provsvndata.freightwatchintl.com") ||
    shExpMatch(host, "rd.sensitechccv.com") ||
    shExpMatch(host, "redmine.tracell.com") ||
    shExpMatch(host, "rf.sensitechccv.com") ||
    shExpMatch(host, "sensitechccv.com") ||
    shExpMatch(host, "sh12.entomo.com") ||
    shExpMatch(host, "sip-lb.prod.purple.us") ||
    shExpMatch(host, "storm.tracell.com") ||
    shExpMatch(host, "tracks.sensitechccv.com") ||
    shExpMatch(host, "tracksapi.sensitechccv.com") ||
    shExpMatch(host, "tracksreports.sensitechccv.com") ||
    shExpMatch(host, "utc.lawtraconline.com") ||
    shExpMatch(host, "utc.longviewhosted.com") ||
    shExpMatch(host, "utc001.entomo.com") ||
    shExpMatch(host, "utcain.com") ||
    shExpMatch(host, "utcaus.com") ||
    shExpMatch(host, "utccgl.com") ||
    shExpMatch(host, "utcmesrec.csc.com") ||
    shExpMatch(host, "vmailer.hovrs.com") ||
    shExpMatch(host, "vpn.ciat.com") ||
    shExpMatch(host, "websvc.prod.purple.us") ||
    shExpMatch(host, "www.argonite.com") ||
    shExpMatch(host, "www.argonite.dk") ||
    shExpMatch(host, "www.carrieronline.com.mx") ||
    shExpMatch(host, "www.chemetronics.com") ||
    shExpMatch(host, "www.d-h-s.dk") ||
    shExpMatch(host, "www.forneycorp.com") ||
    shExpMatch(host, "www.fsfs.net") ||
    shExpMatch(host, "www.fsi-corp.com") ||
    shExpMatch(host, "www.ginge-kerr.dk") ||
    shExpMatch(host, "www.guardfire.com") ||
    shExpMatch(host, "www.hamiltonsundstrand.com") ||
    shExpMatch(host, "www.hs-powersystems.com") ||
    shExpMatch(host, "www.incom-ag.ch") ||
    shExpMatch(host, "www.kmvideo.com") ||
    shExpMatch(host, "www.pyrenecorp.com") ||
    shExpMatch(host, "www.sensitechccv.com") ||
    shExpMatch(host, "www.server1.supplierlink.carrier.com") ||
    shExpMatch(host, "www.server2.supplierlink.carrier.com") ||
    shExpMatch(host, "www.smartpactouch.com") ||
    shExpMatch(host, "www.sundyne.com") ||
    shExpMatch(host, "www.supplierlink.carrier.com") ||
    shExpMatch(host, "www.utcsecurity.com") ||
    shExpMatch(host, "www.vijayin.com") ||
    shExpMatch(host, "159.82.96.204") ||
    shExpMatch(host, "www7.lawtraconline.com") ||
    shExpMatch(host, "eam84.inforcloudsuite.com") ||
    shExpMatch(host, "eam84cog.inforcloudsuite.com") ||
    dnsDomainIs(host, "intra.corp") ||
    shExpMatch(host, ".login.afasonline.com") ||
    shExpMatch(host, "utc.us") ||
    dnsDomainIs(host, "airbus-v.corp")||
    shExpMatch(host, "mobilgw.utc.com") ||
    shExpMatch(host, "services.mathworks.com") ||
    shExpMatch(host, "swdepot-acpt.lmaeronautics.com") ||
    shExpMatch(host, "aerofs-acpt.lmaeronautics.com") ||
    shExpMatch(host, "swdepot.lmaeronautics.com") ||
    shExpMatch(host, "aerospfz.lmaeronautics.com") ||
    shExpMatch(host, "csg.lmaeronautics.com") ||
    shExpMatch(host, "utcts.protonmedia.com") ||
    shExpMatch(host, "utc.protonmedia.com") ||
    shExpMatch(host, "edge.utc.protonmedia.com")||
    shExpMatch(host, "*.corptax.com") ||
    shExpMatch(host, "jira.dx.utc.com") ||
    shExpMatch(host, "confluence.dx.utc.com") ||
    shExpMatch(host, "*.afasonline.nl") ||
    shExpMatch(host, "citrix.emteq.com") ||
    shExpMatch(host, ".afasonline.com") ||
    shExpMatch(host, ".afas.online") ||
    shExpMatch(host, ".afasinsite.nl ") ||
    shExpMatch(host, "esoms.caas.gov.sg") ||
    shExpMatch(host, "web.boeing.com") ||
    shExpMatch(host, "*.conference.apps.mil") ||
    shExpMatch(host, "*.conference-deskshare.apps.mil") ||
    shExpMatch(host, "*.chat.apps.mil") ||
    shExpMatch(host, "conference.apps.mil") ||
    shExpMatch(host, "conference-deskshare.apps.mil") ||
    shExpMatch(host, "onference-mont.apps.mil") ||
    shExpMatch(host, "jp-faco-alis.lmtas.com") ||
    shExpMatch(host, "*.ray.com") ||
    shExpMatch(host, "corpID.rtx.com") ||
    shExpMatch(host, "rtemp-corpID.com") ||
    shExpMatch(host, "137.32.197.228") ||
    shExpMatch(host, "media.rtx.com") ||
    shExpMatch(host, "sso.rtx.com") ||
    shExpMatch(host, "parking.safenetid.com") ||
    shExpMatch(host, "sps.sascloudservice.com") ||
    shExpMatch(host, "3dspacesdv.external.lmco.com") ||
    shExpMatch(host, "3dfcssdv.external.lmco.com") ||
    shExpMatch(host, "3dswymsdv.external.lmco.com") ||
    shExpMatch(host, "3dsearchsdv.external.lmco.com") ||
    shExpMatch(host, "3dpassportsdv.external.lmco.com") ||
    shExpMatch(host, "3ddashboardsdv.external.lmco.com") ||
    shExpMatch(host, "3dnotificationsdv.external.lmco.com") ||
    shExpMatch(host, "3dcommentsdv.external.lmco.com") ||
    shExpMatch(host, "3dbatchsdv.external.lmco.com") ||
    shExpMatch(host, "3dfcsfwsdv.external.lmco.com") ||
    shExpMatch(host, "3dfcsmasdv.external.lmco.com") ||
    shExpMatch(host, "skw-sd-twc01.external.lmco.com") ||
    shExpMatch(host, "home.collins.com") ||
    shExpMatch(host, "sso-test.rtx.com") ||
    shExpMatch(host, "cloud.optimu.eu") ||
    shExpMatch(host, "*.pwcustomertraining-catalog.com") ||
    shExpMatch(host, "dev-rmd.rtxconnect.com") ||
    shExpMatch(host, "qa-rmd.rtxconnect.com") ||
    shExpMatch(host, "stg-rmd.rtxconnect.com") ||
    shExpMatch(host, "rmd.rtxconnect.com") ||
    shExpMatch(host, "dev-ris.rtxconnect.com") ||
    shExpMatch(host, "qa-ris.rtxconnect.com") ||
    shExpMatch(host, "stg-ris.rtxconnect.com") ||
    shExpMatch(host, "ris.rtxconnect.com") ||
    shExpMatch(host, "dev-pw.rtxconnect.com") ||
    shExpMatch(host, "qa-pw.rtxconnect.com") ||
    shExpMatch(host, "stg-pw.rtxconnect.com") ||
    shExpMatch(host, "pw.rtxconnect.com") ||
    shExpMatch(host, "dev-collins.rtxconnect.com") ||
    shExpMatch(host, "qa-collins.rtxconnect.com") ||
    shExpMatch(host, "stg-collins.rtxconnect.com") ||
    shExpMatch(host, "collins.rtxconnect.com") ||
    shExpMatch(host, "pki.rtxintel.com") ||
    shExpMatch(host, "pki.rtx.com") ||
    shExpMatch(host, "*.user.adxrt.com") || 
    shExpMatch(host, "*.device.adxrt.com") ||
    shExpMatch(host, "cnap-connect.code.cdl.af.mil")
    ) return BYPASS;


   /* Special UTC Sites Outside The Firewall - Send to ZCC */
   if (
    shExpMatch(host, "psgsportal.prattwhitney.com") ||
    shExpMatch(host, "*.aeroproxy.hsvas.com") ||
    shExpMatch(host, "emplois-ca.utc.com")||
    shExpMatch(host, "*.hsvas.excelcomm.co") ||
    shExpMatch(host, "*.qualityfair.utc.com") ||
    shExpMatch(host, "accessto.pwr.utc.com") ||
    shExpMatch(host, "adfs-staging.pw.utc.com") ||
    shExpMatch(host, "adfs-staging.pw.utc.com") ||
    shExpMatch(host, "apply.utc.com") ||
    shExpMatch(host, "basuniversity.utc.com") ||
    shExpMatch(host, "bis.utc.com") ||
    shExpMatch(host, "careers.bis.utc.com") ||
    shExpMatch(host, "careers.utc.com") ||
    shExpMatch(host, "cdn.utc.com") ||
    shExpMatch(host, "cdn.www.utc.com") ||
    shExpMatch(host, "cdn-stg.utc.com") ||
    shExpMatch(host, "cms.otis.com") ||
    shExpMatch(host, "cn.utc.com") ||
    shExpMatch(host, "corpid.utc.com") ||
    shExpMatch(host, "ctaerohub.utc.com") ||
    shExpMatch(host, "devcda.ccs.utc.com") ||
    shExpMatch(host, "dev-sitecore.utc.com")||
    shExpMatch(host, "eacommerce-staging.pw.utc.com") ||
    dnsDomainIs(host, "ecall.otis.com") ||
    shExpMatch(host, "ecallstaging.otis.com") ||
    shExpMatch(host, "ecommerce-test.pw.utc.com") ||
    shExpMatch(host, "edialog.confidential.utc.com") ||
    shExpMatch(host, "edirect.otis.com") ||
    shExpMatch(host, "enews.utc.com") ||
    shExpMatch(host, "eservice.otis.com") ||
    shExpMatch(host, "esource-staging.pw.utc.com") ||
    shExpMatch(host, "etqreliance-d.pw.utc.com") ||
    shExpMatch(host, "etqreliance-s.pw.utc.com") ||
    shExpMatch(host, "external.haskel.com") ||
    shExpMatch(host, "extranet.haskel.com") ||
    shExpMatch(host, "files.bis.utc.com") ||
    shExpMatch(host, "files.ccs.utc.com") ||
    shExpMatch(host, "files.stage.ccs.utc.com") ||
    shExpMatch(host, "files-dev.ccs.utc.com") ||
    shExpMatch(host, "files-preview.ccs.utc.com") ||
    shExpMatch(host, "files-qa.ccs.utc.com") ||
    shExpMatch(host, "files-server1.ccs.utc.com") ||
    shExpMatch(host, "files-server2.ccs.utc.com") ||
    shExpMatch(host, "files-stage.bis.utc.com") ||
    shExpMatch(host, "files-stage.ccs.utc.com") ||
    shExpMatch(host, "fleetcare-archive-s.pw.utc.com") ||
    shExpMatch(host, "fleetcare-test.pw.utc.com") ||
    shExpMatch(host, "fleetcare-test-ntlm.pw.utc.com") ||
    shExpMatch(host, "fss-staging.pw.utc.com") ||
    shExpMatch(host, "gen2.otis.com") ||
    dnsDomainIs(host, "github.digital.utc.com") ||
    shExpMatch(host, "investors.utc.com") ||
    shExpMatch(host, "ir.utc.com") ||
    dnsDomainIs(host, "jenkins.digital.utc.com") ||
    shExpMatch(host, "jobs.apac.utc.com") ||
    shExpMatch(host, "jobs.bis.utc.com")||
    shExpMatch(host, "jobs.ccs.utc.com")||
    shExpMatch(host, "jobs.otis.utc.com")||
    shExpMatch(host, "jobs.pw.utc.com") ||
    shExpMatch(host, "jobs.pw.utc.com")||
    shExpMatch(host, "jobs.utc.com") ||
    shExpMatch(host, "jobs.utrc.utc.com")||
    shExpMatch(host, "mba.utc.com") ||
    shExpMatch(host, "mba.utc.com")||
    shExpMatch(host, "militaryengines-staging.pw.utc.com") ||
    shExpMatch(host, "navfzone.com") ||
    shExpMatch(host, "netinspect-staging.pw.utc.com") ||
    shExpMatch(host, "netinspectv5api-staging.pw.utc.com") ||
    shExpMatch(host, "netinspectv5-staging.pw.utc.com") ||
    shExpMatch(host, "newsroom.pw.utc.com") ||
    shExpMatch(host, "ombudsman.confidential.utc.com") ||
    shExpMatch(host, "ondemand-staging.pw.utc.com") ||
    shExpMatch(host, "otisopportunities.otis.com") ||
    shExpMatch(host, "partner-test.pw.utc.com") ||
    shExpMatch(host, "preprod.bis.utc.com") ||
    shExpMatch(host, "proxy-preview.ccs.utc.com") ||
    shExpMatch(host, "pwportal-s.pw.utc.com") ||
    shExpMatch(host, "qacda.ccs.utc.com") ||
    shExpMatch(host, "qa-sitecore.utc.com")||
    dnsDomainIs(host, "repo.digital.utc.com") ||
    shExpMatch(host, "server1-files-preview.ccs.utc.com") ||
    shExpMatch(host, "server1-proxy-preview.ccs.utc.com") ||
    shExpMatch(host, "server2-files-preview.ccs.utc.com") ||
    shExpMatch(host, "server2-proxy-preview.ccs.utc.com") ||
    shExpMatch(host, "sitecore.utc.com")||
    shExpMatch(host, "sitecoreintranet.utc.com") ||
    shExpMatch(host, "sitecoreintranetq.utc.com") ||
    shExpMatch(host, "sitecoreportal.utc.com") ||
    shExpMatch(host, "sitecoreportalq.utc.com") ||
    dnsDomainIs(host, "sonar.digital.utc.com") ||
    shExpMatch(host, "ssovipstage.utc.com") ||
    shExpMatch(host, "stage.bis.utc.com") ||
    shExpMatch(host, "stage.ccs.utc.com") ||
    shExpMatch(host, "stage-utc.utc.com") ||
    shExpMatch(host, "staging.pw.utc.com") ||
    shExpMatch(host, "staging61-ews.pw.utc.com") ||
    shExpMatch(host, "staging61-ews461.pw.utc.com") ||
    shExpMatch(host, "staging61-ews462.pw.utc.com") ||
    shExpMatch(host, "staging-iaews461.iaeworld.com") ||
    shExpMatch(host, "staging-iaews462.iaeworld.com") ||
    shExpMatch(host, "staging-iaews1.iaeworld.com") ||
    shExpMatch(host, "staging-techpubs.iaeworld.com") ||
    shExpMatch(host, "supplier-export-s.pw.utc.com") ||
    shExpMatch(host, "supplierregistration.utc.com") ||
    shExpMatch(host, "suppliers.utc.com") ||
    shExpMatch(host, "supplier-us-s.pw.utc.com") ||
    shExpMatch(host, "swep-prod2.pw.utc.com") ||
    shExpMatch(host, "swep-stage-new.pw.utc.com") ||
    shExpMatch(host, "utap.utc.com")||
    shExpMatch(host, "vcts-staging.iaeworld.com") ||
    shExpMatch(host, "www.bis.utc.com") ||
    shExpMatch(host, "www.carrier.com.mx") ||
    shExpMatch(host, "www.ccs.utc.com") ||
    shExpMatch(host, "www.cn.utc.com")||
    shExpMatch(host, "www.enflite.com") ||
    shExpMatch(host, "www.fhsfirst.otis.com") ||
    shExpMatch(host, "www.hsvas.com") ||
    shExpMatch(host, "www.lifeport.com") ||
    shExpMatch(host, "www.microsofthup.com") ||
    shExpMatch(host, "www.otis.com") ||
    shExpMatch(host, "www.snds.com") ||
    shExpMatch(host, "www.supplierregistration.utc.com") ||
    shExpMatch(host, "www3.utc.com") ||
    shExpMatch(host, "www8.snds.com") ||
    shExpMatch(host, "efast-sim.pw.utc.com")||
    shExpMatch(host, "efast.pw.utc.com")||
    shExpMatch(host, "www-server1.ccs.utc.com") ||
    shExpMatch(host, "www-server2.ccs.utc.com") ||
    shExpMatch(host, "utcstockfeed.utc.com") ||
    shExpMatch(host, "fusion.utc.com") ||
    shExpMatch(host, "knowmypt6.pwc.ca") ||
    shExpMatch(host, "knowmypt6q.pwc.ca") ||
    shExpMatch(host, "makers.utc.com") ||
    shExpMatch(host, "airtime.pwc.ca") ||
    shExpMatch(host, "airtimeq.pwc.ca") ||
    shExpMatch(host, "airshow.pw.utc.com") ||
    shExpMatch(host, "dev-makers.utc.com") ||
    shExpMatch(host, "qa-makers.utc.com") ||
    shExpMatch(host, "stg-makers.utc.com") ||
    shExpMatch(host, "stg-future.utc.com") ||
    shExpMatch(host, "welcometopwcd.pwc.ca") ||
    shExpMatch(host, "welcometopwcq.pwc.ca") ||
    shExpMatch(host, "welcometopwc.pwc.ca") ||
    shExpMatch(host, "pwcregistrationd.pwc.ca") ||
    shExpMatch(host, "pwcregistrationq.pwc.ca") ||
    shExpMatch(host, "pwcregistration.pwc.ca") ||
    shExpMatch(host, "adem.pw.utc.com") ||
    shExpMatch(host, "india.pw.utc.com") ||
    shExpMatch(host, "adem-ea.pw.utc.com") ||
    shExpMatch(host, "adem-ngpf.pw.utc.com") ||
    shExpMatch(host, "files.otis.com") ||
    shExpMatch(host, "welcome.pwc.ca") ||
    shExpMatch(host, "cmq.pwc.ca") ||
    shExpMatch(host, "wwwq.pwc.ca") ||
    shExpMatch(host, "pwcregistration.pwc.ca") ||
    shExpMatch(host, "airshow.prattwhitney.com") ||
    shExpMatch(host, "india.prattwhitney.com") ||
    shExpMatch(host, "jobs.prattwhitney.com") ||
    shExpMatch(host, "newsroom.prattwhitney.com") ||
    shExpMatch(host, "www.prattwhitney.com") ||
    shExpMatch(host, "milportal-stg.prattwhitney.com") ||
    shExpMatch(host, "jenws-stg.prattwhitney.com") ||
    shExpMatch(host, "mews-stg.prattwhitney.com") ||
    shExpMatch(host, "mil-image-stg.prattwhitney.com") ||
    shExpMatch(host, "jengadgets-stg.prattwhitney.com") ||
    shExpMatch(host, "meapps-stg.prattwhitney.com") ||
    shExpMatch(host, "www.airshow.prattwhitney.com") ||
    shExpMatch(host, "www.india.prattwhitney.com") ||
    shExpMatch(host, "www.jobs.prattwhitney.com") ||
    shExpMatch(host, "www.newsroom.prattwhitney.com") ||
    shExpMatch(host, "prattwhitney.com") ||
    shExpMatch(host, "milportal.prattwhitney.com") ||
    shExpMatch(host, "jenws.prattwhitney.com") ||
    shExpMatch(host, "mews.prattwhitney.com") ||
    shExpMatch(host, "mil-image.prattwhitney.com") ||
    shExpMatch(host, "jengadgets.prattwhitney.com") ||
    shExpMatch(host, "meapps.prattwhitney.com") ||
    shExpMatch(host, "*.raytheonintelligenceandspace.com") ||
    shExpMatch(host, "*.raytheonmissilesanddefense.com") ||
    shExpMatch(host, "servicesq.pwc.ca") ||
    shExpMatch(host, "services.pwc.ca") ||
    shExpMatch(host, "siq.pwc.ca") ||
    shExpMatch(host, "si.pwc.ca") ||
    shExpMatch(host, "efast-sim.prattwhitney.com") ||
    shExpMatch(host, "efast.prattwhitney.com") ||
    shExpMatch(host, "webauth.raytheon.com") ||
    shExpMatch(host, "webauth-crt.raytheon.com") ||
    shExpMatch(host, "webauth-test.raytheon.com") ||
    shExpMatch(host, "webauth-test-crt.raytheon.com") ||
    shExpMatch(host, "rclouddesktop-hdx.raytheon.com") ||
    shExpMatch(host, "rclouddesktop.raytheon.com") ||
    shExpMatch(host, "webvpn.raytheon.com") ||
    shExpMatch(host, "www.raytheon.com") ||
    shExpMatch(host, "psgsportal-test.prattwhitney.com") ||
    shExpMatch(host, "pwportal-s.prattwhitney.com") ||
    shExpMatch(host, "pwportal.prattwhitney.com") ||
    shExpMatch(host, "elc2021.prattwhitney.com") ||
    shExpMatch(host, "ur.prattwhitney.com") ||
    shExpMatch(host, "ur-s.prattwhitney.com") ||
    dnsDomainIs(host, "liferesourcesray.com") ||
    dnsDomainIs(host, "rmail.raytheon.com") ||
    dnsDomainIs(host, "www.raytheon.com") ||
    dnsDomainIs(host, "me.ehm.prattwhitney.com") ||
    dnsDomainIs(host, "me.qa-ehm.prattwhitney.com") ||
    shExpMatch(host, "innovation.prattwhitney.com")
    ) return "PROXY 127.0.0.1:9000";


/* PWC Specific Web Site Directives - Send Proxy */
if (
    dnsDomainIs(host, "corp-sandbox-cm.pwc.ca") ||
    shExpMatch(host, "corp-sandbox.pwc.ca") ||
    shExpMatch(host, "cm.pwc.ca") ||
    shExpMatch(host, "cmd.pwc.ca") ||
    shExpMatch(host, "wwwd.pwc.ca") ||
    shExpMatch(host, "www.pwc.ca")
    ) return "PROXY 127.0.0.1:9000";

/* P&W Specific Web Site Directives - Send DIRECT */
if (
    shExpMatch(host, "*.cac.dss.mil") ||
    shExpMatch(host, "*.iaeworld.com") ||
    shExpMatch(host, "*.sso.dss.mil") ||
    shExpMatch(host, "137.32.208.*") ||
    shExpMatch(host, "137.32.209.*") ||
    shExpMatch(host, "cac.dss.mil") ||
    shExpMatch(host, "cerbere-na.airbus.com") ||
    shExpMatch(host, "enterprisehr.us.adphc.com") ||
    shExpMatch(host, "gate-na.airbus.com") ||
    shExpMatch(host, "local.connectme.us") ||
    shExpMatch(host, "sso.dss.mil")
    ) return BYPASS;


/* Intranet Sites - Send DIRECT */
if (
    shExpMatch(host, "*.aerospacepower.com") ||
    shExpMatch(host, "*.aes.com") ||
    shExpMatch(host, "*.carrier.com.mx") ||
    shExpMatch(host, "*.carrier.utc.com") ||
    shExpMatch(host, "*.comanchenet.com") ||
    shExpMatch(host, "*.corphq.utc.com") ||
    shExpMatch(host, "*.eh.pweh.com") ||
    shExpMatch(host, "*.enflite.com") ||
    shExpMatch(host, "*.fs.utc.com") ||
    shExpMatch(host, "*.ga.pweh.com") ||
    shExpMatch(host, "*.haskel.com") ||
    shExpMatch(host, "*.hs.utc.com") ||
    shExpMatch(host, "*.hsd.utc.com") ||
    shExpMatch(host, "*.ihsxtra.net") ||
    shExpMatch(host, "*.lifeport.com") ||
    shExpMatch(host, "*.mt.pweh.com") ||
    shExpMatch(host, "*.myutc.com") ||
    shExpMatch(host, "*.na.1utcfs.com") ||
    shExpMatch(host, "*.nb.pweh.com") ||
    shExpMatch(host, "*.otis.com") ||
    shExpMatch(host, "*.pratt-whitney.com") ||
    shExpMatch(host, "*.private.ihserc.com") ||
    shExpMatch(host, "*.pwapp.us") ||
    shExpMatch(host, "*.pwc.ca") ||
    shExpMatch(host, "*.pwemail.us") ||
    shExpMatch(host, "*.pwfl.com") ||
    shExpMatch(host, "*.pwintl.us") ||
    shExpMatch(host, "*.pwlrintl.us") ||
    shExpMatch(host, "*.pwus.us") ||
    shExpMatch(host, "*.res.utc.com") ||
    shExpMatch(host, "*.sikintl.com") ||
    shExpMatch(host, "*.snds.com") ||
    shExpMatch(host, "*.usbi.com") ||
    shExpMatch(host, "*.uta.com") ||
    shExpMatch(host, "*.utc.com") ||
    shExpMatch(host, "*.utc.us") ||
    shExpMatch(host, "*.utcapp.com") ||
    shExpMatch(host, "*.utccommercial.us") ||
    shExpMatch(host, "*.utcitar.us") ||
    shExpMatch(host, "*.utcmail.com") ||
    shExpMatch(host, "*nnoaz.net") ||
    shExpMatch(host, "127.0.0.1") ||
    shExpMatch(host, "128.11.137.203") ||
    shExpMatch(host, "128.11.138.201") ||
    shExpMatch(host, "128.11.138.218") ||
    shExpMatch(host, "141.119.13.151") ||
    shExpMatch(host, "141.119.68.240") ||
    shExpMatch(host, "141.119.9.120") ||
    shExpMatch(host, "151.131.34.238") ||
    shExpMatch(host, "153.4.57.*") ||
    shExpMatch(host, "153.40.*.*") ||
    shExpMatch(host, "153.51.26.*") ||
    shExpMatch(host, "153.51.90.*") ||
    shExpMatch(host, "153.51.91.*") ||
    shExpMatch(host, "159.82.*.*") ||
    shExpMatch(host, "161.145.62.38") ||
    shExpMatch(host, "165.207.239.*") ||
    shExpMatch(host, "165.207.40.*") ||
    shExpMatch(host, "165.207.7.*") ||
    shExpMatch(host, "191.251.170.132") ||
    shExpMatch(host, "64.41.133.200") ||
    shExpMatch(host, "businessobjects*.1utcfs.com") ||
    shExpMatch(host, "carpupc2-65.chntva1-dc1.cscehub.com") ||
    shExpMatch(host, "carpupd2-66.chntva1-dc1.cscehub.com") ||
    shExpMatch(host, "carsupb2-64.chntva1-dc1.cscehub.com") ||
    shExpMatch(host, "enterprises.societegenerales.fr") ||
    shExpMatch(host, "era*.1utcfs.com") ||
    shExpMatch(host, "hs.procurestaff.com") ||
    shExpMatch(host, "myutc.com") ||
    shExpMatch(host, "oracle*.1utcfs.com") ||
    shExpMatch(host, "solidedge.1utcfs.com") ||
    shExpMatch(host, "solidedgedev.1utcfs.com") ||
    shExpMatch(host, "*.webex.com") ||
    shExpMatch(host, "itoperations.1utcfs.com") ||
    shExpMatch(host, "sp.lenel.com") ||
    shExpMatch(host, "utc.com") ||
    shExpMatch(host, "dcmetrics.1utcfs.com") ||
    shExpMatch(host, "enterprisehr.us.adphc.com") ||
    shExpMatch(host, "secure.1utcfs.com") ||
    shExpMatch(host, "storeqa.interlogix.com") ||
    shExpMatch(host, "172.23.116.6") ||
    shExpMatch(host, "172.23.26.198") ||
    shExpMatch(host, "172.23.25.11") ||
    shExpMatch(host, "172.23.26.10") ||
    shExpMatch(host, "172.23.26.9") ||
    shExpMatch(host, "172.23.29.87") ||
    shExpMatch(host, "172.19.153.200") ||
    isInNet(host, "141.119.0.0", "255.255.0.0") ||
    shExpMatch(host, "*.prattwhitney.com") ||
    shExpMatch(host, "ess.raytheon.com") ||
    shExpMatch(host, "ess-test.raytheon.com") ||
    shExpMatch(host, "essw4-test.raytheon.com") ||
    shExpMatch(host, "essw4.raytheon.com") ||
    shExpMatch(host, "*-link*.rtx.com")
    ) return BYPASS;



/* Get The IP Address Of The Target Host Web Server */
var resolved_host_ip = dnsResolve(host);
/* When No DNS entry for the host exists don't leave resolved_host_ip as null as this causes subsequent performance problems */
if (resolved_host_ip == null) resolved_host_ip = "0.0.0.0";

/* Send plain hostnames and private IPs direct */
    if (isPlainHostName(host) || privateIP.test(resolved_host_ip) || privateIP.test(host))
      return BYPASS;


/* NDC (159.82.144.0 / 167.17.192.0 / 167.17.224.0) and MDC (159.82.160.0 / 167.17.208.0 / 167.17.240.0) Hosted Website Subnets - Send DIRECT */
if (
    isInNet(resolved_host_ip, "159.82.144.0", "255.255.240.0") ||
    isInNet(resolved_host_ip, "159.82.160.0", "255.255.240.0") ||
    isInNet(resolved_host_ip, "167.17.192.0", "255.255.240.0") ||
    isInNet(resolved_host_ip, "167.17.208.0", "255.255.240.0") ||
    isInNet(resolved_host_ip, "167.17.224.0", "255.255.240.0") ||
    isInNet(resolved_host_ip, "167.17.240.0", "255.255.240.0")
    ) return BYPASS;

/* P&W IP Host Subnets In The Intranet - Send DIRECT */
if (
    isInNet(resolved_host_ip, "140.157.0.0", "255.255.0.0") ||
    isInNet(resolved_host_ip, "191.29.0.0", "255.255.0.0") ||
    isInNet(resolved_host_ip, "191.34.0.0", "255.255.0.0") ||
    isInNet(resolved_host_ip, "191.37.0.0", "255.255.0.0") ||
    isInNet(resolved_host_ip, "191.38.0.0", "255.255.0.0") ||
    isInNet(resolved_host_ip, "191.224.0.0", "255.255.0.0")
    ) return BYPASS;

/* Hamilton 151.131 or 153.4 Network - Send DIRECT */
if (
    isInNet(resolved_host_ip, "151.131.0.0", "255.255.0.0") ||
    isInNet(resolved_host_ip, "153.4.0.0", "255.255.0.0")
    ) return BYPASS;

/* Legacy Goodrich Network - Send DIRECT */
if (
    isInNet(resolved_host_ip, "146.58.0.0", "255.255.0.0") ||
    isInNet(resolved_host_ip, "149.223.0.0", "255.255.0.0") ||
    isInNet(resolved_host_ip, "159.88.0.0", "255.255.0.0") ||
    isInNet(resolved_host_ip, "168.204.0.0", "255.255.0.0") ||
    isInNet(resolved_host_ip, "170.126.0.0", "255.255.0.0")
    ) return BYPASS;

/* Rockwell Collins Network - Send DIRECT */
if (
    isInNet(resolved_host_ip, "131.198.0.0", "255.254.0.0") ||
    isInNet(resolved_host_ip, "198.151.224.0", "255.255.254.0") ||
    isInNet(resolved_host_ip, "198.151.226.0", "255.255.255.0") ||
    isInNet(resolved_host_ip, "128.24.0.0", "255.255.0.0") ||
    isInNet(resolved_host_ip, "199.33.65.0", "255.255.255.0")
    ) return BYPASS;

/* LIFE PORT VOIP RANGE - Send DIRECT */
if (
    isInNet(resolved_host_ip, "140.76.212.0", "255.255.252.0")
    ) return BYPASS;

/* ihsxtra.net - Send DIRECT */
if (
    isInNet(resolved_host_ip, "192.77.15.64", "255.255.255.192")
    ) return BYPASS;

/* Bypass for ZPA - Send DIRECT */
	if (
        isInNet(resolved_host_ip, "100.64.0.0", "255.255.0.0")
    ) return BYPASS;
    
/* Other Special Sites - Send DIRECT */
if (
    isInNet(resolved_host_ip, "137.32.24.0", "255.255.255.0") ||
    isInNet(resolved_host_ip, "137.32.25.0", "255.255.255.0")
    ) return BYPASS;

/* Special Check For Site 2375/172.30.208.* To 83.11.236.4 - Send DIRECT */
if (
    isInNet(resolved_host_ip, "83.111.236.4", "255.255.255.255") &&
    isInNet(myip, "172.30.208.0", "255.255.255.0")
    ) return BYPASS;


// Temp rule for Airbus, to be removed once we start using Aero VZENs

if (((SRCIP=="192.249.36.3") ||
    (SRCIP=="192.249.36.13") ||
    (SRCIP=="192.249.39.3") ||
    (SRCIP=="192.249.39.13")) &&
    dnsDomainIs(host, "axess-fr.airbus.corp") ||
    dnsDomainIs(host, "axess-uk.airbus.corp") ||
    dnsDomainIs(host, "axess-na.airbus.corp") ||
    dnsDomainIs(host, "axess-ge.airbus.corp") ||
    dnsDomainIs(host, "axess-es.airbus.corp") ||
    dnsDomainIs(host, "axess-as.airbus.corp")
  ) return "PROXY vzencom.ray.com:80";



/* Use Dassault Virtual Plateau Proxy For Everyone For Certain Websites */

if (
    shExpMatch(host, "fsenomtsms.smsbox.dassault-avion.val") ||
    shExpMatch(host, "fsenoopsms.dassault-avion.fr") ||
    shExpMatch(host, "fsenoopsms.smsbox.dassault-avion.fr") ||
    shExpMatch(host, "fsenoopsms.smsbox.dassault-avion.val") ||
    shExpMatch(host, "fsenoopsms.plateau3.dassault-avion.fr") ||
    shExpMatch(host, "*.sms-rcs.com")
    ) return "PROXY xnwpv21i-nat.utc.com:3128";

/* Bypass for PulseSecure */
if (
	isInNet(resolved_host_ip, "192.249.48.2", "255.255.255.255") ||
	isInNet(resolved_host_ip, "192.249.47.2", "255.255.255.255") ||
	isInNet(resolved_host_ip, "192.249.36.34", "255.255.255.255") ||
	isInNet(resolved_host_ip, "192.249.41.34", "255.255.255.255") ||
	isInNet(resolved_host_ip, "141.119.213.18", "255.255.255.255")
) return BYPASS;

/* Bypass for RC PulseSecure */
if (
    shExpMatch(host, "*.ra.rockwellcollins.com") ||
    shExpMatch(host, "connect-dev.rockwellcollins.com")
) return BYPASS;


/* PWA AT&T UCaaS - Send DIRECT */
if (
    isInNet(resolved_host_ip, "100.70.124.0", "255.255.255.0") 
    ) return BYPASS;
    
/* Rest of the traffic */

return "PROXY 127.0.0.1:9000";
}
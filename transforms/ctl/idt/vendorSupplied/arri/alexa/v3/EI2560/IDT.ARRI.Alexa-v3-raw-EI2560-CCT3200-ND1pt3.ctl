
// <ACEStransformID>urn:ampas:aces:transformId:v1.5:IDT.ARRI.Alexa-v3-raw-EI2560-CCT3200-ND1pt3.a1.v2</ACEStransformID>
// <ACESuserName>ACES 1.0 Input - ARRIRAW (EI2560, 3200K, ND1.3)</ACESuserName>

// ARRI ALEXA IDT for ALEXA linear files
//  with camera EI set to 2560
//  and CCT of adopted white set to 3200K
// Written by v3_IDT_maker.py v0.09 on Thursday 22 December 2016

const float EI = 2560.0;
const float black = 256.0 / 65535.0;
const float exp_factor = 0.18 / (0.01 * (400.0/EI));

void main
(	input varying float rIn,
	input varying float gIn,
	input varying float bIn,
	input varying float aIn,
	output varying float rOut,
	output varying float gOut,
	output varying float bOut,
	output varying float aOut)
{

	// convert to white-balanced, black-subtracted linear values
	float r_lin = (rIn - black) * exp_factor;
	float g_lin = (gIn - black) * exp_factor;
	float b_lin = (bIn - black) * exp_factor;

	// convert to ACES primaries using CCT-dependent matrix
	rOut = r_lin * 7.4275802443266e-01 + g_lin * 1.2495657898958e-01 + b_lin * 1.3228539657776e-01;
	gOut = r_lin * 3.3502503638775e-02 + g_lin * 1.0294040885405e+00 + b_lin * -6.2906592179269e-02;
	bOut = r_lin * 6.7389698380217e-02 + g_lin * -5.0699967744994e-01 + b_lin * 1.4396099790697e+00;
	aOut = 1.0;

}

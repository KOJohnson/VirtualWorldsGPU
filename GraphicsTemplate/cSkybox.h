#pragma once
#include "core.h"

class cSkybox
{
public:
	cSkybox();
	~cSkybox();
	void init();

	char** m_tex;
};
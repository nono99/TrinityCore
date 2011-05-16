#include "ScriptPCH.h"
#include "WorldPacket.h"

class npc_teleport : public CreatureScript
{
public:
    npc_teleport() : CreatureScript("npc_teleport") { }

    bool OnGossipHello(Player *pPlayer, Creature *pCreature)
    {
        uint8 PlayerTeam = (pPlayer->GetTeam() == ALLIANCE) ? 0 : 1;
        uint32 NPCLevel = pCreature->getLevel(); //80 = Both, 81 = Horde, 82 = Alliance
        if ((NPCLevel == 81 && PlayerTeam != 1) || (NPCLevel == 82 && PlayerTeam != 0))
        {
            pCreature->MonsterWhisper("Te manda... Soh sirvo seus inimigos!", pPlayer->GetGUID());
            return true;
        }

        uint32 PlayerLevel = pPlayer->getLevel();
        uint8 PlayerKlasse = pPlayer->getClass();

        pPlayer->ADD_GOSSIP_ITEM(10, "Custos por teleport:", GOSSIP_SENDER_MAIN, 6111);
        pPlayer->ADD_GOSSIP_ITEM(10, "Level 1-70 -> 50 pratas", GOSSIP_SENDER_MAIN, 6111);
        pPlayer->ADD_GOSSIP_ITEM(10, "Level 80 -> 1 gold", GOSSIP_SENDER_MAIN, 6111);
        pPlayer->ADD_GOSSIP_ITEM(10, " ", GOSSIP_SENDER_MAIN, 6111);

        if (ALLIANCE == pPlayer->GetTeam())
        {
            pPlayer->ADD_GOSSIP_ITEM(5, "Teleport para Stormwind", GOSSIP_SENDER_MAIN, 6201);
            pPlayer->ADD_GOSSIP_ITEM(5, "Teleport para Ironforge", GOSSIP_SENDER_MAIN, 6202);
            pPlayer->ADD_GOSSIP_ITEM(5, "Teleport para Darnassus", GOSSIP_SENDER_MAIN, 6203);
            pPlayer->ADD_GOSSIP_ITEM(5, "Teleport para Exodar", GOSSIP_SENDER_MAIN, 6204);
        }
        else
        {
            pPlayer->ADD_GOSSIP_ITEM(5, "Teleport para Orgrimmar", GOSSIP_SENDER_MAIN, 6211);
            pPlayer->ADD_GOSSIP_ITEM(5, "Teleport para Thunder Bluff", GOSSIP_SENDER_MAIN, 6212);
            pPlayer->ADD_GOSSIP_ITEM(5, "Teleport para Undercity", GOSSIP_SENDER_MAIN, 6213);
            pPlayer->ADD_GOSSIP_ITEM(5, "Teleport para Silvermoon City", GOSSIP_SENDER_MAIN, 6214);
        }
        if (pPlayer->getClass() == 6) // Death Knight
        {
            pPlayer->ADD_GOSSIP_ITEM(5, "Teleport para Break Death", GOSSIP_SENDER_MAIN, 6206);
            pPlayer->ADD_GOSSIP_ITEM(5, "Тeleport para Acherus", GOSSIP_SENDER_MAIN, 6207);
        }
        if (PlayerLevel >= 30)
            pPlayer->ADD_GOSSIP_ITEM(5, "Teleport para Gurubashi Arena", GOSSIP_SENDER_MAIN, 6200);
        if (PlayerLevel >= 58)
            pPlayer->ADD_GOSSIP_ITEM(5, "Teleport para Shattrath", GOSSIP_SENDER_MAIN, 6208);
        if (PlayerLevel >= 65)
            pPlayer->ADD_GOSSIP_ITEM(5, "Teleport para Isle of Quel'Danas", GOSSIP_SENDER_MAIN, 6209);
        if (PlayerLevel >= 70)
            pPlayer->ADD_GOSSIP_ITEM(5, "Teleport para Dalaran", GOSSIP_SENDER_MAIN, 6210);

        if (ALLIANCE == pPlayer->GetTeam())
            pPlayer->ADD_GOSSIP_ITEM(5, "Teleport para Azshara Crater", GOSSIP_SENDER_MAIN, 6402);
        else
            pPlayer->ADD_GOSSIP_ITEM(5, "Teleport para Azshara Crater", GOSSIP_SENDER_MAIN, 6401);

        pPlayer->PlayerTalkClass->SendGossipMenu(2713, pCreature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player *pPlayer, Creature *pCreature, uint32 /*uiSender*/, uint32 uiAction)
    {
        switch (uiAction)
        {
            case 6200: custom_teleport_port(0, -13234.1f, 217.387f, 31.6759f, 1.06815f, pPlayer, pCreature); break;
            case 6201: custom_teleport_port(0, -8908.96f, 556.3f, 93.5345f, 0.73f, pPlayer, pCreature); break;
            case 6202: custom_teleport_port(0, -4821.6f, -1155.58f, 502.2345f, 3.33532f, pPlayer, pCreature); break;
            case 6203: custom_teleport_port(1, 9947.53f, 2604.15f, 1316.19f, 4.223f, pPlayer, pCreature); break;
            case 6204: custom_teleport_port(530, -4054.75f, -11793.4f, 11.1139f, 1.51503f, pPlayer, pCreature); break;
            case 6205: custom_teleport_port(1, 45.951f, 1218.27f, 146.713f, 0.063138f, pPlayer, pCreature); break;
            case 6206: custom_teleport_port(609, 2362.29f, -5693.76f, 153.922f, 3.77816f, pPlayer, pCreature); break;
            case 6207: custom_teleport_port(609, 2348.74f, -5694.94f, 384.088f, 3.90954f, pPlayer, pCreature); break;
            case 6208: custom_teleport_port(530, -1879.5f, 5409.46f, -12.4277f, 1.0332f, pPlayer, pCreature); break;
            case 6209: custom_teleport_port(530, 13000.2f, -6907.51f, 12.0f, 1.06815f, pPlayer, pCreature); break;
            case 6210: custom_teleport_port(571, 5814.2f, 446.337f, 659.201f, 1.41145f, pPlayer, pCreature); break;
            case 6211: custom_teleport_port(1, 1677.91f, -4314.79f, 62.35f, 2.66969f, pPlayer, pCreature); break;
            case 6212: custom_teleport_port(1, -1197.18f, 29.2706f, 179.755f, 2.9666f, pPlayer, pCreature); break;
            case 6213: custom_teleport_port(0, 1568.48f, 268.52f, -42.1384f, 1.69719f, pPlayer, pCreature); break;
            case 6214: custom_teleport_port(530, 9373.08f, -7166.07f, 11.4763f, 5.38653f, pPlayer, pCreature); break;
            case 6215: custom_teleport_port(1, -1790.17f, 3055.44f, 9.35831f, 1.06815f, pPlayer, pCreature); break;
            case 6216: custom_teleport_port(1, -11846.4f, -4756.91f, 6.25831f, 0.305114f, pPlayer, pCreature); break;

            case 6401: custom_teleport_port(37, -28.6567f, 971.069f, 347.305f, 5.79912f, pPlayer, pCreature); break;
            case 6402: custom_teleport_port(37, 1094.2f, 298.032f, 338.616f, 3.21441f, pPlayer, pCreature); break;
        }

        pPlayer->CLOSE_GOSSIP_MENU();
        return true;
    }

    void custom_teleport_port(uint32 a, float b, float c, float d, float e, Player* pPlayer, Creature* pCreature)
    {
        uint8 PlayerLevel = pPlayer->getLevel();
        uint32 costs = (PlayerLevel <= 70) ? 5000 : 10000;

        if (pPlayer->GetMoney() < costs)
        {
            pCreature->MonsterWhisper("Voce nao tem dinheiro suficiente.", pPlayer->GetGUID());
            return;
        }

        pPlayer->ModifyMoney((costs*(-1)));

        char* temp = "";
        switch (urand(1,4))
        {
            case 1: temp = "Bon voyage!"; break;
            case 2: temp = "Mais um cliente satisfeito .."; break;
            case 3: temp = "Excelente escolha!"; break;
            case 4: temp = "Mais rapido que o vento!"; break;
        }
        char const* text = temp;

        pCreature->MonsterWhisper(text, pPlayer->GetGUID());

        pPlayer->TeleportTo(a,b,c,d,e);
        return;
    }
};

void AddSC_npc_teleport()
{
    new npc_teleport;
}
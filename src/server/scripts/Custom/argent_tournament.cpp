#include "ScriptPCH.h"
#include "SpellAuraEffects.h"
#include "ScriptMgr.h"

class spell_tournament_charge : public SpellScriptLoader
{
    public:
        spell_tournament_charge() : SpellScriptLoader("spell_tournament_charge") { }

        class spell_tournament_charge_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_tournament_charge_SpellScript);

            void HandleEffectScriptEffect(SpellEffIndex /*effIndex*/)
            {
                if (Unit* pTarget = GetHitUnit())
                {
                    if (Unit *caster = GetCaster())
                    {
                        caster->CastSpell(pTarget, 74399, true);
                        caster->CastSpell(pTarget, 68321, true);

                        if (pTarget->GetTypeId() == TYPEID_UNIT && pTarget->ToCreature()->GetEntry() == 33272)
                        {
                            //Kill Credit
                            if (Unit *player = caster->GetCharmerOrOwner())
                                player->CastSpell(player, 62658, true);
                        }
                    }

                    if (pTarget->GetAura(64100))
                        pTarget->RemoveAuraFromStack(64100);
                    else if (pTarget->GetAura(62552))
                        pTarget->RemoveAuraFromStack(62552);
                    else if (pTarget->GetAura(62719))
                        pTarget->RemoveAuraFromStack(62719);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_tournament_charge_SpellScript::HandleEffectScriptEffect, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript *GetSpellScript() const
        {
            return new spell_tournament_charge_SpellScript();
        }
};


class spell_tournament_shield : public SpellScriptLoader
{
    public:
        spell_tournament_shield() : SpellScriptLoader("spell_tournament_shield") { }

        class spell_tournament_shield_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_tournament_shield_SpellScript);

            void HandleEffectScriptEffect(SpellEffIndex /*effIndex*/)
            {
                if (Unit* pTarget = GetHitUnit())
                {
                    if (Unit *caster = GetCaster())
                    {
                        caster->CastSpell(pTarget, 62626, true );

                        if (pTarget->GetTypeId() == TYPEID_UNIT && pTarget->ToCreature()->GetEntry() == 33243)
                        {
                            //Kill Credit
                            if (Unit *player = caster->GetCharmerOrOwner())
                                player->CastSpell(player, 62673, true);
                        }
                    }

                    if (pTarget->GetAura(64100))
                        pTarget->RemoveAuraFromStack(64100);
                    else if (pTarget->GetAura(62552))
                        pTarget->RemoveAuraFromStack(62552);
                    else if (pTarget->GetAura(62719))
                        pTarget->RemoveAuraFromStack(62719);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_tournament_shield_SpellScript::HandleEffectScriptEffect, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript *GetSpellScript() const
        {
            return new spell_tournament_shield_SpellScript();
        }
};


class spell_tournament_melee : public SpellScriptLoader
{
    public:
        spell_tournament_melee() : SpellScriptLoader("spell_tournament_melee") { }

        class spell_tournament_melee_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_tournament_melee_SpellScript);

            void HandleEffectScriptEffect(SpellEffIndex /*effIndex*/)
            {
                if (Unit* pTarget = GetHitUnit())
                {
                    if (Unit *caster = GetCaster())
                    {
                        if (pTarget->GetTypeId() == TYPEID_UNIT && pTarget->ToCreature()->GetEntry() == 33229)
                        {
                            //Kill Credit
                            if (Unit *player = caster->GetCharmerOrOwner())
                                player->CastSpell(player, 62672, true);
                        }
                    }
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_tournament_melee_SpellScript::HandleEffectScriptEffect, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
            }
        };

        SpellScript *GetSpellScript() const
        {
            return new spell_tournament_melee_SpellScript();
        }
};


class spell_tournament_duel : public SpellScriptLoader
{
    public:
        spell_tournament_duel() : SpellScriptLoader("spell_tournament_duel") { }

        class spell_tournament_duel_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_tournament_duel_SpellScript);

            void HandleEffectScriptEffect(SpellEffIndex /*effIndex*/)
            {
                if (Unit* pTarget = GetHitUnit())
                {
                    if (pTarget->GetTypeId() != TYPEID_PLAYER)
                        return;

                    if (Unit *caster = GetCaster()->GetCharmerOrOwner())
                        caster->CastSpell(pTarget, 62875, true);
                }
            }

            void Register()
            {
                OnEffect += SpellEffectFn(spell_tournament_duel_SpellScript::HandleEffectScriptEffect, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript *GetSpellScript() const
        {
            return new spell_tournament_duel_SpellScript();
        }
};


/*######
## npc_ring_champions
######*/
#define GOSSIP_SQUIRE__CHAMP_ITEM_1 "I'm ready for battle!"
#define SAY_START_1      "Defend yourself!"
#define SAY_START_2      "Get ready!"
#define SAY_DIE_1        "Wimp!"
#define SAY_DIE_2        "You were not worthy!"
#define SAY_END          "I was defeated. Great fight!"

class npc_ring_champions : public CreatureScript
{
public:
    npc_ring_champions() : CreatureScript("npc_ring_champions") { }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (pPlayer->GetQuestStatus(13790) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(13793) == QUEST_STATUS_INCOMPLETE ||
            pPlayer->GetQuestStatus(13811) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(13814) == QUEST_STATUS_INCOMPLETE)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SQUIRE__CHAMP_ITEM_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        }
        pPlayer->SEND_GOSSIP_MENU(14407, pCreature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
        {
            pPlayer->CLOSE_GOSSIP_MENU();
            pCreature->MonsterSay(urand(0,1) ? SAY_START_1 : SAY_START_2, LANG_UNIVERSAL, 0);
            pCreature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE);
            pCreature->setFaction(14);
            pCreature->CombatStart(pPlayer);
        }
        return true;
    }

    struct npc_ring_championsAI : public ScriptedAI
    {
        npc_ring_championsAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
        }

        uint32 uiChargeTimer;
        uint32 uiShieldBreakerTimer;

        void Reset()
        {
            me->setFaction(35);
            uiChargeTimer = 7000;
            uiShieldBreakerTimer = 10000;
        }

        void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
        {
            if (uiDamage > me->GetHealth() && pDoneBy->GetTypeId() == TYPEID_PLAYER)
            {
                uiDamage = 0;
                me->CombatStop(false);
                CAST_PLR(pDoneBy)->CastSpell(pDoneBy, 63596, true);//Reward mark
                me->MonsterSay(SAY_END, LANG_UNIVERSAL, 0);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE);
                EnterEvadeMode();
            }
        }

        void KilledUnit(Unit* pVictim)
        {
            me->MonsterSay(urand(0,1) ? SAY_DIE_1 : SAY_DIE_2, LANG_UNIVERSAL, 0);
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (uiChargeTimer <= uiDiff)
            {
                DoCastVictim(63010);
                uiChargeTimer = 7000;
            } else uiChargeTimer -= uiDiff;

            if (uiShieldBreakerTimer <= uiDiff)
            {
                DoCastVictim(65147);
                uiShieldBreakerTimer = 10000;
            } else uiShieldBreakerTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_ring_championsAI(creature);
    }
};


/*######
## npc_ring_valiants
######*/
class npc_ring_valiants : public CreatureScript
{
public:
    npc_ring_valiants() : CreatureScript("npc_ring_valiants") { }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (pPlayer->GetQuestStatus(13665) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(13745) == QUEST_STATUS_INCOMPLETE ||
            pPlayer->GetQuestStatus(13761) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(13767) == QUEST_STATUS_INCOMPLETE ||
            pPlayer->GetQuestStatus(13772) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(13777) == QUEST_STATUS_INCOMPLETE ||
            pPlayer->GetQuestStatus(13782) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(13787) == QUEST_STATUS_INCOMPLETE ||
            pPlayer->GetQuestStatus(13750) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(13756) == QUEST_STATUS_INCOMPLETE)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SQUIRE__CHAMP_ITEM_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        }
        pPlayer->SEND_GOSSIP_MENU(14407, pCreature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
        {
            pPlayer->CLOSE_GOSSIP_MENU();
            pCreature->MonsterSay(urand(0,1) ? SAY_START_1 : SAY_START_2, LANG_UNIVERSAL, 0);
            pCreature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE);
            pCreature->setFaction(14);
            pCreature->CombatStart(pPlayer);
        }
        return true;
    }

    struct npc_ring_valiantsAI : public ScriptedAI
    {
        npc_ring_valiantsAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
        }

        uint32 uiChargeTimer;
        uint32 uiShieldBreakerTimer;

        void Reset()
        {
            me->setFaction(35);
            uiChargeTimer = 7000;
            uiShieldBreakerTimer = 10000;
        }

        void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
        {
            if (uiDamage > me->GetHealth() && pDoneBy->GetTypeId() == TYPEID_PLAYER)
            {
                uiDamage = 0;
                me->CombatStop(false);
                CAST_PLR(pDoneBy)->CastSpell(pDoneBy, 62724, true);//Reward mark
                me->MonsterSay(SAY_END, LANG_UNIVERSAL, 0);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE);
                EnterEvadeMode();
            }
        }

        void KilledUnit(Unit* pVictim)
        {
            me->MonsterSay(urand(0,1) ? SAY_DIE_1 : SAY_DIE_2, LANG_UNIVERSAL, 0);
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (uiChargeTimer <= uiDiff)
            {
                DoCastVictim(63010);
                uiChargeTimer = 7000;
            } else uiChargeTimer -= uiDiff;

            if (uiShieldBreakerTimer <= uiDiff)
            {
                DoCastVictim(65147);
                uiShieldBreakerTimer = 10000;
            } else uiShieldBreakerTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_ring_valiantsAI(creature);
    }
};

/*######
## npc_lake_frog
######*/

#define NPC_MAIDEN 33220
#define TRANSFORM_MAIDEN 62550
#define WARTS_SPELL 62581
#define LIP_BALM_SPELL 62574
#define FROG_LOVE 62537
#define SUMMON_ASHOOD_BRAND_SPELL 62554
#define MAIDEN_SAY "Could it be? Free after all these years?"

struct A_BLADE_FIT_FOR_A_CHAMPION_QUEST
{ 
  uint32 quest_id; 
};

A_BLADE_FIT_FOR_A_CHAMPION_QUEST new_quest[] = {13603, 13666, 13673, 13741, 13746, 13752, 13757, 13762, 13768, 13773, 13778, 13783};

class npc_lake_frog : public CreatureScript
{
public:
    npc_lake_frog() : CreatureScript("npc_lake_frog") { }

    struct npc_lake_frogAI : public ScriptedAI
    {
        npc_lake_frogAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
        }

        void ReceiveEmote(Player* pPlayer, uint32 emote)
        {
            switch (emote)
            {
                case TEXTEMOTE_KISS:

                    if (me->HasAura(FROG_LOVE))
                        return;

                    if (!pPlayer->HasAura(LIP_BALM_SPELL))
                    {
                        me->CastSpell(pPlayer, WARTS_SPELL, true);
                        return;
                    }

                    if (pPlayer->GetQuestStatus(13603) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(13666) == QUEST_STATUS_INCOMPLETE ||
                        pPlayer->GetQuestStatus(13673) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(13741) == QUEST_STATUS_INCOMPLETE ||
                        pPlayer->GetQuestStatus(13746) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(13752) == QUEST_STATUS_INCOMPLETE ||
                        pPlayer->GetQuestStatus(13757) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(13762) == QUEST_STATUS_INCOMPLETE ||
                        pPlayer->GetQuestStatus(13768) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(13773) == QUEST_STATUS_INCOMPLETE ||
                        pPlayer->GetQuestStatus(13778) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(13783) == QUEST_STATUS_INCOMPLETE )
                    {
                        if (rand()%4 == 1)
                        {
                            me->CastSpell(me, TRANSFORM_MAIDEN, true);
                            me->MonsterSay(MAIDEN_SAY, LANG_UNIVERSAL, 0);
                            me->UpdateEntry(NPC_MAIDEN); //For gossip
                            me->ForcedDespawn(30000);
                        }
                        else
                            me->CastSpell(me, FROG_LOVE, true);
                    }

                    break;
            }
        }
    };

    CreatureAI *GetAI(Creature* pCreature) const
    {
        return new npc_lake_frogAI(pCreature);
    }
};


void AddSC_argen_tournament()
{
    new spell_tournament_charge;
    new spell_tournament_shield;
    new spell_tournament_melee;
    new spell_tournament_duel;
    new npc_ring_champions;
    new npc_ring_valiants;
    new npc_lake_frog;
}

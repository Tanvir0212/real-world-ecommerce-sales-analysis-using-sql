<img width="1868" height="906" alt="bigquery" src="https://github.com/user-attachments/assets/1bfae0d5-2b90-4204-8044-e6d305db7c94" />

# 🎯 Target — E-Commerce Sales Analysis: Insights & Recommendations
---
## Section 1 — Exploratory Overview

**Dataset Scope:** Orders span from **September 2016 to October 2018** — roughly 2 years of transaction data across Brazilian states, covering customers, 
orders, items, and payments.

**Customer Geography:** The dataset captures customers across all Brazilian states. The top 5 states by customer volume are SP (41,746), RJ (12,852), MG (11,635), 
RS (5,466), and PR (5,045) — reflecting Brazil's highly urbanized southeast corridor dominating e-commerce activity.

---

## Section 2 — Order Trend & Seasonality

**Yearly Growth — Strong Upward Trend:**

| Year | Orders |
|------|--------|
| 2016 | 329 *(partial year)* |
| 2017 | 45,101 |
| 2018 | 54,011 |

The business grew nearly **20% year-over-year** from 2017 to 2018 — a clear signal of accelerating e-commerce adoption in Brazil.

> **Recommendation:** Invest in scaling logistics and warehouse capacity proactively, as growth momentum shows no sign of slowing.
> Projections for 2019 should account for at least 20–25% more volume.

**Monthly Seasonality — Mid-Year Dominance:**

Orders peak in **May, July, and August** (10,000+ orders/month), while **September, October, and December** are notably weaker. Interestingly, December, 
typically a global retail peak — underperforms, suggesting Brazilian shopping patterns differ from Western holiday norms.

> **Recommendation:** Run targeted promotions during the mid-year surge (May–August) to capture peak demand. Investigate why December is soft,
>  it may be an opportunity to launch Brazil-specific holiday campaigns (e.g., around Black Friday Brasil, which falls in November and already shows a bump).

**Time of Day — Afternoon Dominance:**

| Time Slot | Orders |
|-----------|--------|
| Afternoon (1–6 PM) | 38,135 |
| Night (7–11 PM) | 28,331 |
| Morning (7 AM–12 PM) | 27,733 |
| Dawn (12–6 AM) | 5,242 |

The majority of orders are placed during **afternoon hours**, likely during work breaks or lunch, with a secondary night-time peak.

> **Recommendation:** Schedule flash sales, push notifications, and email campaigns to fire between **1 PM – 6 PM local Brazilian time** for maximum conversion.
> Avoid heavy ad spend during dawn hours.

---

## Section 3 — E-Commerce Evolution Across States

**Customer Concentration is Extreme:**
São Paulo alone accounts for **~41% of all customers**, and the top 5 states together represent over **75%** of the entire customer base. Most northern 
and central-west states have minimal presence.

> **Recommendation:** While SP/RJ/MG are cash cows, states like AM, PA, and RO represent **untapped growth markets**. A targeted expansion strategy with
> regional warehouses could unlock significant volume in the north, especially given rising internet penetration in those areas.

---

## Section 4 — Economic Impact & Revenue

**Revenue Growth (Jan–Aug Comparison):**

| Period | Revenue |
|--------|---------|
| Jan–Aug 2017 | R$ 3,669,022 |
| Jan–Aug 2018 | R$ 8,694,733 |
| **% Increase** | **+136.98%** |

This is an extraordinary figure — revenue more than **doubled** in a single year on a like-for-like basis.

> **Recommendation:** Identify what drove this spike — whether it was catalog expansion, marketing investment, or macro factors,
>  and double down. Ensuring the supply chain and customer service infrastructure can sustain this pace is critical to avoid churn from poor experiences.

**Revenue by State — SP Dominates:**
São Paulo generates over **R$ 5.2M in total item revenue**, more than double RJ (R$ 1.8M) in second place. However, RJ and MG customers 
have a slightly **higher average item price** (~R$125 vs SP's ~R$110), suggesting those markets skew toward premium purchases.

> **Recommendation:** Consider premium product lines or curated "high-value" storefronts targeted at RJ and MG customers to maximize revenue
> per order in those states.

---

## Section 5 — Freight, Delivery Time & Logistics

**Freight Cost Disparity:**

| Highest Freight States | Avg Freight (R$) | Lowest Freight States | Avg Freight (R$) |
|---|---|---|---|
| RR | 42.98 | DF | 21.04 |
| PB | 42.72 | RJ | 20.96 |
| RO | 41.07 | MG | 20.63 |
| AC | 40.07 | PR | 20.53 |
| PI | 39.15 | SP | 15.15 |

States in Brazil's north and northeast pay **nearly 3x more freight** than SP. This likely suppresses demand in those regions.

> **Recommendation:** Explore freight subsidy programs or regional carrier partnerships in high-freight states (RR, AC, RO) to lower the barrier to purchase
> and grow the customer base there.

**Delivery Time — Speed Gap is Significant:**

| Slowest States | Avg Days | Fastest States | Avg Days |
|---|---|---|---|
| RR | 29.0 | SC | 14.5 |
| AP | 26.7 | DF | 12.5 |
| AM | 26.0 | MG | 11.5 |
| AL | 24.0 | PR | 11.5 |
| PA | 23.3 | **SP** | **8.3** |

São Paulo customers receive orders in just over **8 days** on average while customers in Roraima wait nearly **29 days** — a 3.5x difference. This is a major 
customer experience gap.

> **Recommendation:** Set realistic, transparent delivery expectations for northern states in the checkout flow to reduce cancellations and negative reviews.
> Long-term, invest in fulfillment center micro-hubs in AM or PA to reduce transit time.

**Delivery vs. Estimated Date — A Positive Story:**
Interestingly, the states with the *worst* absolute delivery times (AC, RO, AP, AM, RR) are also the ones where orders **arrive earliest relative to 
the estimated date** — by 16–20 days ahead of estimate. This means Target significantly over-promises delivery time in the north.

> **Recommendation:** Recalibrate delivery estimates for northern states. Showing a more accurate (even if longer) expected delivery date will improve customer
> satisfaction scores and reduce support tickets, while still delighting customers when orders arrive "early."

---

## Section 6 — Payment Behavior

**Payment Type Distribution:**

| Payment Type | Orders |
|---|---|
| Credit Card | 76,795 |
| UPI | 19,784 |
| Voucher | 5,775 |
| Debit Card | 1,529 |

**Credit cards dominate** at ~74% of transactions. UPI's strong presence (~19%) is notable and growing across digital-first markets.

> **Recommendation:** Ensure a frictionless credit card checkout experience as the top priority. Invest in UPI optimization as a growth lever,
>  offer UPI-exclusive cashback deals to drive adoption among younger, mobile-first shoppers.

**Installment Preferences:**
Nearly **49,000 orders were paid in a single installment**, but a meaningful segment (12,389 orders) opted for 2 installments, and over 5,000 chose 10 installments,
signaling that buy-now-pay-later mechanics matter to Brazilian consumers.

> **Recommendation:** Prominently surface installment options at checkout — especially for high-value cart sizes. Offering "0% interest in up to X installments"
> promotions during seasonal peaks could significantly boost average order values.

---

## 🔑 Top 5 Strategic Recommendations Summary

1. **Expand logistics into northern Brazil** — High freight costs and long delivery times in states like AM, RO, and RR are suppressing growth.
2. Regional fulfillment investment will unlock a new customer base.
3. **Time campaigns for the afternoon (1–6 PM)** — This is peak ordering time; aligning ad spend and promotions to this window will maximize ROI.
4. **Recalibrate delivery estimates in the north** — Over-promising and under-delivering damages trust; accurate estimates improve satisfaction even
5. when delivery takes longer.
6. **Capitalize on the 136% revenue growth with supply chain investment** — The explosive growth curve demands infrastructure scaling before
7. it becomes a bottleneck.
8. **Leverage installment payments as a conversion tool** — Brazilian consumers are installment-friendly; making this a more visible and promoted
9. feature at checkout can lift both conversion rate and average order value.

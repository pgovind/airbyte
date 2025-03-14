#
# Copyright (c) 2021 Airbyte, Inc., all rights reserved.
#


from typing import Any, List, Mapping, Tuple

import pendulum
import stripe
from airbyte_cdk import AirbyteLogger
from airbyte_cdk.sources import AbstractSource
from airbyte_cdk.sources.streams import Stream
from airbyte_cdk.sources.streams.http.auth import TokenAuthenticator
from source_stripe.streams import (
    BalanceTransactions,
    BankAccounts,
    Charges,
    Coupons,
    CustomerBalanceTransactions,
    Customers,
    Disputes,
    Events,
    InvoiceItems,
    InvoiceLineItems,
    Invoices,
    PaymentIntents,
    Payouts,
    Plans,
    Products,
    Refunds,
    SubscriptionItems,
    Subscriptions,
    Transfers,
)


class SourceStripe(AbstractSource):
    def check_connection(self, logger: AirbyteLogger, config: Mapping[str, Any]) -> Tuple[bool, Any]:
        try:
            stripe.api_key = config["client_secret"]
            stripe.Account.retrieve(config["account_id"])
            return True, None
        except Exception as e:
            return False, e

    def streams(self, config: Mapping[str, Any]) -> List[Stream]:
        authenticator = TokenAuthenticator(config["client_secret"])
        start_date = pendulum.parse(config["start_date"]).int_timestamp
        args = {"authenticator": authenticator, "account_id": config["account_id"], "start_date": start_date}
        incremental_args = {**args, "lookback_window_days": config.get("lookback_window_days")}
        return [
            BalanceTransactions(**incremental_args),
            BankAccounts(**args),
            Charges(**incremental_args),
            Coupons(**incremental_args),
            CustomerBalanceTransactions(**args),
            Customers(**incremental_args),
            Disputes(**incremental_args),
            Events(**incremental_args),
            InvoiceItems(**incremental_args),
            InvoiceLineItems(**args),
            Invoices(**incremental_args),
            PaymentIntents(**incremental_args),
            Payouts(**incremental_args),
            Plans(**incremental_args),
            Products(**incremental_args),
            Refunds(**incremental_args),
            SubscriptionItems(**args),
            Subscriptions(**incremental_args),
            Transfers(**incremental_args),
        ]

// Copyright (c) .NET Foundation. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

namespace Microshaoft.Extensions.Logging
{
    using System;
    using System.Reflection;
    public static class ProviderAliasUtilities
    {
        private const string AliasAttibuteTypeFullName = "Microsoft.Extensions.Logging.ProviderAliasAttribute";
        private const string AliasAttibuteAliasProperty = "Alias";

        public static string GetAlias(Type providerType)
        {
            foreach (var attribute in providerType.GetTypeInfo().GetCustomAttributes(inherit: false))
            {
                if (attribute.GetType().FullName == AliasAttibuteTypeFullName)
                {
                    var valueProperty = attribute
                        .GetType()
                        .GetProperty(AliasAttibuteAliasProperty, BindingFlags.Public | BindingFlags.Instance);

                    if (valueProperty != null)
                    {
                        return (valueProperty.GetValue(attribute) as string)!;
                    }
                }
            }

            return null!;
        }
    }
}
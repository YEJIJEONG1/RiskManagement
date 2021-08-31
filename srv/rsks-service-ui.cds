using RiskService from './risk-service';


annotate RiskService.Risks with {

title @title: 'Title';
owner @title: 'Owner';
prio @title: 'Priority';
descr @title: 'Description'; 
miti_id @title: 'Mitigation'; 
//bp @title: 'Business Partner'; 
impact @title: 'Impact'; 
}
annotate RiskService.Mitigations with {
ID @(
UI.Hidden,
Common: {
Text: description
}); 
description @title: 'Description'; 
owner @title: 'Owner'; 
timeline @title: 'Timeline'; 
risks @title: 'Risks'; 
}
annotate RiskService.Risks with @(
UI: {
HeaderInfo: {
TypeName: 'Risk',
TypeNamePlural: 'Risks',
Title: {Value: title},
Description: {Value: descr}
},
SelectionFields: [prio],
LineItem: [
{Value: title},
{Value: miti_id},
{Value: owner},
//{Value: bp_BusinessPartner},
{
Value: prio,
Criticality: criticality 
}
,
{
Value: impact,
Criticality: criticality
}
],
Facets: [
{$Type: 'UI.ReferenceFacet', Label: 'Main', Target: '@UI.FieldGroup#Main'}
],
FieldGroup#Main: {
Data: [
{Value: title},
{Value: miti_id},
{Value: descr},
{Value: owner},
{
Value: prio,
Criticality: criticality
},
// {Value: bp_BusinessPartner},
{
Value: impact,
Criticality: criticality
}
]
}	
},
) {
}; 
annotate RiskService.Risks with {
miti_id @(	
Common: {
//show text, not id for mitigation in the context of risks
Text: miti.description , TextArrangement: #TextOnly,
ValueList: {
Label: 'Mitigations',
CollectionPath: 'Mitigations',
Parameters: [
{ $Type: 'Common.ValueListParameterInOut', 
LocalDataProperty: miti_id, 
ValueListProperty: 'ID' 
},
{ $Type: 'Common.ValueListParameterDisplayOnly', 
ValueListProperty: 'description' 
} 
]
}
}
);
	/*
185	
186	bp @(	
187	
188	Common: {
189	
190	Text: bp.LastName , TextArrangement: #TextOnly,
191	
192	ValueList: {
193	
194	Label: 'Business Partners',
195	
196	CollectionPath: 'BusinessPartners',
197	
198	Parameters: [
199	
200	{ $Type: 'Common.ValueListParameterInOut', 
201	
202	LocalDataProperty: bp_BusinessPartner, 
203	
204	ValueListProperty: 'BusinessPartner' 
205	
206	},
207	
208	{ $Type: 'Common.ValueListParameterDisplayOnly', 
209	
210	ValueListProperty: 'LastName' 
211	
212	},
213	
214	{ $Type: 'Common.ValueListParameterDisplayOnly', 
215	
216	ValueListProperty: 'FirstName' 
217	
218	} 
219	
220	]
221	
222	}
223	
224	}
225	
226	)	
227	
228	*/
	
	}
 
/*
	
235	annotate RiskService.BusinessPartners with {
236	
237	BusinessPartner @(
238	
239	UI.Hidden,
240	
241	Common: {
242	
243	Text: LastName
244	
245	}
246	
247	); 
248	
249	LastName @title: 'Last Name'; 
250	
251	FirstName @title: 'First Name'; 
252	
253	}
254	
255	*/